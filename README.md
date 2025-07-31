
## Commands

### Development Workflow

- `/bunify-scripts` - Convert shell scripts to Bun TypeScript scripts
- `/changelog [version or date range]` - Generate comprehensive changelog from git commits
- `/commit` - Smart commit with generated message and push
- `/commit-and-push` - Smart commit with generated message and push
- `/optimize` - Analyze code performance and suggest optimizations
- `/todo` - Manage project todos in todos.md file
- `/visualize <target>` - Generate explanatory diagrams from code and architecture

### Analysis & Reflection

- `/think [problem]` - Basic analytical thinking
- `/think-harder [problem]` - Enhanced analytical thinking
- `/think-ultra [complex problem]` - Ultra-comprehensive analysis
- `/ultrathink <task>` - Use 4 agents to evaluate a coding pow-wow
- `/reflection` - Analyze and improve Claude Code instructions
- `/reflection-harder` - Comprehensive session analysis and learning

### Problem Solving

- `/findoptions` - Analyze different approaches for a task or problem
- `/five` - Use the five why's process to evaluate issues
- `/summary` - Generate comprehensive summaries from current chat

### Documentation & Knowledge

- `/create-command [name] [description]` - Create new Claude Code commands


## Agents

The `agents/` directory contains specialized AI [subagents](https://docs.anthropic.com/en/docs/claude-code/sub-agents) that extend Claude Code's capabilities.

### Analysis & Documentation
- **instruction-reflector** - Analyzes and improves Claude Code instructions
- **deep-reflector** - Comprehensive session analysis and learning capture
- **deep-thinker** - Enhanced analytical thinking for complex problems
- **ultra-thinker** - Ultra-comprehensive analytical thinking
- **insight-documenter** - Technical breakthrough documentation specialist

### Development & Engineering
- **ui-engineer** - UI/UX development specialist
- **ux-ui-designer** - User experience design and interface creation expert
- **typescript-react-code-reviewer** - TypeScript, React, and Next.js code review specialist
- **senior-dev-test-architect** - Senior developer for code review, refactoring, and test strategies
- **devops-platform-engineer** - Cloud infrastructure, CI/CD, and platform reliability expert

### Product & Process
- **product-owner-process-steward** - Product artifacts validation and documentation consistency
- **command-creator** - Expert at creating new Claude Code custom commands


## Other
- I also use [ccnotify](https://github.com/dazuiba/CCNotify) to get pings when stuff is done. (Mac only)

## References

- [Claude Code official document](https://docs.anthropic.com/en/docs/claude-code/overview) - must read official document.
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) - curated list of slash-commands, CLAUDE.md files, CLI tools, and other resources.
- [wshobson/agents](https://github.com/wshobson/agents) - comprehensive collection of specialized AI subagents for Claude Code.
- [feiskyer/claude-code-settings](https://github.com/feiskyer/claude-code-settings) - provided several agents / commands
