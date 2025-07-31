
## Commands

### Development Workflow

- [`/bunify-scripts`](commands/user/bunify-scripts.md) - Convert shell scripts to Bun TypeScript scripts
- [`/changelog [version or date range]`](commands/user/changelog.md) - Generate comprehensive changelog from git commits
- [`/commit`](commands/user/commit.md) - Smart commit with generated message and push
- [`/commit-and-push`](commands/user/commit-and-push.md) - Smart commit with generated message and push
- [`/optimize`](commands/user/optimize.md) - Analyze code performance and suggest optimizations
- [`/todo`](commands/user/todo.md) - Manage project todos in todos.md file
- [`/visualize <target>`](commands/user/visualize.md) - Generate explanatory diagrams from code and architecture

### Analysis & Reflection

- [`/think [problem]`](commands/user/think.md) - Basic analytical thinking
- [`/think-harder [problem]`](commands/user/think-harder.md) - Enhanced analytical thinking
- [`/think-ultra [complex problem]`](commands/user/think-ultra.md) - Ultra-comprehensive analysis
- [`/ultrathink <task>`](commands/user/ultrathink.md) - Use 4 agents to evaluate a coding pow-wow
- [`/reflection`](commands/user/reflection.md) - Analyze and improve Claude Code instructions
- [`/reflection-harder`](commands/user/reflection-harder.md) - Comprehensive session analysis and learning

### Problem Solving

- [`/findoptions`](commands/user/findoptions.md) - Analyze different approaches for a task or problem
- [`/five`](commands/user/five.md) - Use the five why's process to evaluate issues
- [`/summary`](commands/user/summary.md) - Generate comprehensive summaries from current chat

### Documentation & Knowledge

- [`/create-command [name] [description]`](commands/user/create-command.md) - Create new Claude Code commands


## Agents

The `agents/` directory contains specialized AI [subagents](https://docs.anthropic.com/en/docs/claude-code/sub-agents) that extend Claude Code's capabilities.

### Analysis & Documentation
- [**instruction-reflector**](agents/instruction-reflector.md) - Analyzes and improves Claude Code instructions
- [**deep-reflector**](agents/deep-reflector.md) - Comprehensive session analysis and learning capture
- [**deep-thinker**](agents/deep-thinker.md) - Enhanced analytical thinking for complex problems
- [**ultra-thinker**](agents/ultra-thinker.md) - Ultra-comprehensive analytical thinking
- [**insight-documenter**](agents/insight-documenter.md) - Technical breakthrough documentation specialist

### Development & Engineering
- [**ui-engineer**](agents/ui-engineer.md) - UI/UX development specialist
- [**ux-ui-designer**](agents/ux-ui-designer.md) - User experience design and interface creation expert
- [**typescript-react-code-reviewer**](agents/typescript-react-code-reviewer.md) - TypeScript, React, and Next.js code review specialist
- [**senior-dev-test-architect**](agents/senior-dev-test-architect.md) - Senior developer for code review, refactoring, and test strategies
- [**devops-platform-engineer**](agents/devops-platform-engineer.md) - Cloud infrastructure, CI/CD, and platform reliability expert

### Product & Process
- [**product-owner-process-steward**](agents/product-owner-process-steward.md) - Product artifacts validation and documentation consistency
- [**command-creator**](agents/command-creator.md) - Expert at creating new Claude Code custom commands
- [**strategic-analyst-ideator**](agents/strategic-analyst-ideator.md) - Market research, competitive analysis, brainstorming, and project discovery


## Other
- I also use [ccnotify](https://github.com/dazuiba/CCNotify) to get pings when stuff is done. (Mac only)

## References

- [Claude Code official document](https://docs.anthropic.com/en/docs/claude-code/overview) - must read official document.
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) - curated list of slash-commands, CLAUDE.md files, CLI tools, and other resources.
- [wshobson/agents](https://github.com/wshobson/agents) - comprehensive collection of specialized AI subagents for Claude Code.
- [feiskyer/claude-code-settings](https://github.com/feiskyer/claude-code-settings) - provided several agents / commands
