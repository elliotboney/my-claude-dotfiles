#!/bin/bash
# Claude Code Status Line - Real usage data from Anthropic API
# Reads OAuth token from macOS Keychain, caches API response for 60s
#
# Line 1: Model | context <bar> used/total | thinking
# Line 2: Current (5h): <bar> | Weekly (7d): <bar>

CACHE_FILE="/tmp/claude-statusline-usage-cache.json"
CACHE_MAX_AGE=300  # seconds between API calls (5 minutes)

input=$(cat)

# ── ANSI codes ──
E=$'\033'
RST="${E}[0m"
BOLD="${E}[1m"
DIM="${E}[2m"
BLUE="${E}[38;2;0;153;255m"
ORANGE="${E}[38;2;255;176;85m"
GREEN="${E}[38;2;0;160;0m"
CYAN="${E}[38;2;46;149;153m"
RED="${E}[38;2;255;85;85m"
YELLOW="${E}[38;2;230;200;0m"
WHITE="${E}[38;2;220;220;220m"

# ── Extract fields from status line JSON ──
MODEL=$(echo "$input" | jq -r '.model.display_name // "Claude"')
CTX_SIZE=$(echo "$input" | jq -r '.context_window.context_window_size // 200000')
CTX_PCT=$(echo "$input" | jq -r '.context_window.used_percentage // 0' | cut -d. -f1)

# Token calculations from current_usage
CURRENT_TOKENS=$(echo "$input" | jq -r '
  (.context_window.current_usage.input_tokens // 0) +
  (.context_window.current_usage.cache_creation_input_tokens // 0) +
  (.context_window.current_usage.cache_read_input_tokens // 0)
')
if [ -z "$CURRENT_TOKENS" ] || [ "$CURRENT_TOKENS" = "null" ]; then CURRENT_TOKENS=0; fi

# ── Format token counts (e.g., 50k / 200k) ──
format_tokens() {
  local n=$1
  if [ "$n" -ge 1000000 ]; then
    echo "$(echo "$n" | awk '{printf "%.1fm", $1/1000000}')"
  elif [ "$n" -ge 1000 ]; then
    echo "$(echo "$n" | awk '{printf "%dk", $1/1000}')"
  else
    echo "$n"
  fi
}

# ── Build a colored progress bar ──
# Args: $1=percent $2=width
# Outputs bar chars with color based on %
build_bar() {
  local pct=$1 width=$2
  [ "$pct" -lt 0 ] 2>/dev/null && pct=0
  [ "$pct" -gt 100 ] 2>/dev/null && pct=100
  local filled=$(( pct * width / 100 ))
  local empty=$(( width - filled ))

  # Color based on usage level
  local clr="$GREEN"
  [ "$pct" -ge 50 ] && clr="$ORANGE"
  [ "$pct" -ge 70 ] && clr="$YELLOW"
  [ "$pct" -ge 90 ] && clr="$RED"

  local bar_filled="" bar_empty=""
  for ((i=0; i<filled; i++)); do bar_filled+="█"; done
  for ((i=0; i<empty; i++)); do bar_empty+="░"; done

  printf "%s%s%s%s%s" "$clr" "$bar_filled" "$DIM" "$bar_empty" "$RST"
}

# ── Context bar (different color scheme: cyan base) ──
build_ctx_bar() {
  local pct=$1 width=$2
  [ "$pct" -lt 0 ] 2>/dev/null && pct=0
  [ "$pct" -gt 100 ] 2>/dev/null && pct=100
  local filled=$(( pct * width / 100 ))
  local empty=$(( width - filled ))

  local clr="$CYAN"
  [ "$pct" -ge 50 ] && clr="$BLUE"
  [ "$pct" -ge 70 ] && clr="$YELLOW"
  [ "$pct" -ge 90 ] && clr="$RED"

  local bar_filled="" bar_empty=""
  for ((i=0; i<filled; i++)); do bar_filled+="█"; done
  for ((i=0; i<empty; i++)); do bar_empty+="░"; done

  printf "%s%s%s%s%s" "$clr" "$bar_filled" "$DIM" "$bar_empty" "$RST"
}

# ── Token info ──
USED_FMT=$(format_tokens "$CURRENT_TOKENS")
TOTAL_FMT=$(format_tokens "$CTX_SIZE")

# ── Check thinking status ──
THINKING_ON=false
if [ -f "$HOME/.claude/settings.json" ]; then
  THINKING_VAL=$(jq -r '.alwaysThinkingEnabled // false' "$HOME/.claude/settings.json" 2>/dev/null)
  [ "$THINKING_VAL" = "true" ] && THINKING_ON=true
fi

# ═══ LINE 1: Model | context bar + tokens | thinking ═══
CTX_BAR_L1=$(build_ctx_bar "$CTX_PCT" 10)
LINE1="${BLUE}${MODEL}${RST}"
LINE1+=" ${DIM}|${RST} "
LINE1+="${CTX_BAR_L1} ${CYAN}${USED_FMT} / ${TOTAL_FMT}${RST}"
LINE1+=" ${DIM}|${RST} "
LINE1+="thinking: "
if $THINKING_ON; then
  LINE1+="${ORANGE}On${RST}"
else
  LINE1+="${DIM}Off${RST}"
fi

# ═══ LINE 2: Usage limits from API (cached) ═══
USAGE_DATA=""
NEEDS_REFRESH=true

# Check cache freshness
if [ -f "$CACHE_FILE" ]; then
  CACHE_MOD=$(stat -f %m "$CACHE_FILE" 2>/dev/null || stat -c %Y "$CACHE_FILE" 2>/dev/null || echo 0)
  NOW=$(date +%s)
  CACHE_AGE=$(( NOW - CACHE_MOD ))
  if [ "$CACHE_AGE" -lt "$CACHE_MAX_AGE" ]; then
    NEEDS_REFRESH=false
    USAGE_DATA=$(cat "$CACHE_FILE" 2>/dev/null)
  fi
fi

# Fetch fresh data if cache is stale
if $NEEDS_REFRESH; then
  CREDS=$(security find-generic-password -s "Claude Code-credentials" -w 2>/dev/null)
  if [ -n "$CREDS" ]; then
    TOKEN=$(echo "$CREDS" | jq -r '.claudeAiOauth.accessToken // empty')
    if [ -n "$TOKEN" ]; then
      RESPONSE=$(curl -s --max-time 5 \
        -H "Accept: application/json" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer $TOKEN" \
        -H "anthropic-beta: oauth-2025-04-20" \
        -H "User-Agent: claude-code/2.1.34" \
        "https://api.anthropic.com/api/oauth/usage" 2>/dev/null)
      if [ -n "$RESPONSE" ] && echo "$RESPONSE" | jq . >/dev/null 2>&1; then
        echo "$RESPONSE" > "$CACHE_FILE"
        USAGE_DATA="$RESPONSE"
      fi
    fi
  fi
  # Fall back to stale cache
  if [ -z "$USAGE_DATA" ] && [ -f "$CACHE_FILE" ]; then
    USAGE_DATA=$(cat "$CACHE_FILE" 2>/dev/null)
  fi
fi

LINE2=""
BAR_W=10

if [ -n "$USAGE_DATA" ]; then
  # ── 5-hour (current) ──
  FIVE_PCT=$(echo "$USAGE_DATA" | jq -r '.five_hour.utilization // 0' | awk '{printf "%d", $1+0.5}')

  # ── 7-day (weekly) ──
  SEVEN_PCT=$(echo "$USAGE_DATA" | jq -r '.seven_day.utilization // 0' | awk '{printf "%d", $1+0.5}')

  # Build line 2: usage bars
  LINE2="${WHITE}current:${RST} $(build_bar "$FIVE_PCT" "$BAR_W") ${CYAN}${FIVE_PCT}%${RST}"
  LINE2+=" ${DIM}|${RST} "
  LINE2+="${WHITE}weekly:${RST} $(build_bar "$SEVEN_PCT" "$BAR_W") ${CYAN}${SEVEN_PCT}%${RST}"

  # ── Extra usage ──
  EXTRA_ENABLED=$(echo "$USAGE_DATA" | jq -r '.extra_usage.is_enabled // false')
  if [ "$EXTRA_ENABLED" = "true" ]; then
    EXTRA_PCT=$(echo "$USAGE_DATA" | jq -r '.extra_usage.utilization // 0' | awk '{printf "%d", $1+0.5}')
    EXTRA_USED=$(echo "$USAGE_DATA" | jq -r '.extra_usage.used_credits // 0' | awk '{printf "%.2f", $1/100}')
    EXTRA_LIMIT=$(echo "$USAGE_DATA" | jq -r '.extra_usage.monthly_limit // 0' | awk '{printf "%.2f", $1/100}')
    LINE2+=" ${DIM}|${RST} "
    LINE2+="${WHITE}extra:${RST} $(build_bar "$EXTRA_PCT" "$BAR_W") ${CYAN}\$${EXTRA_USED}/\$${EXTRA_LIMIT}${RST}"
  fi

fi

# ═══ Output ═══
printf "%s" "$LINE1"
[ -n "$LINE2" ] && printf "\n%s" "$LINE2"
