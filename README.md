# My Cursor Dotfiles

Hey all! Just stashing my personal collection of dotfiles for cursor that I'm using. Some are made by me, some are yoinked from others and modified and some might just be yoinked. 

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

### Language Specialists
- [**javascript-pro**](agents/javascript-pro.md) - Master modern JavaScript with ES6+, async patterns, and Node.js APIs
- [**php-pro**](agents/php-pro.md) - Write idiomatic PHP code with modern features and performance optimizations
- [**python-pro**](agents/python-pro.md) - Write idiomatic Python code with advanced features and optimizations
- [**sql-pro**](agents/sql-pro.md) - Write complex SQL queries, optimize execution plans, and design normalized schemas

### Data & AI
- [**ai-engineer**](agents/ai-engineer.md) - Build LLM applications, RAG systems, and prompt pipelines
- [**data-engineer**](agents/data-engineer.md) - Build ETL pipelines, data warehouses, and streaming architectures
- [**data-scientist**](agents/data-scientist.md) - Data analysis expert for SQL queries, BigQuery operations, and data insights
- [**ml-engineer**](agents/ml-engineer.md) - Implement ML pipelines, model serving, and feature engineering
- [**mlops-engineer**](agents/mlops-engineer.md) - Build ML pipelines, experiment tracking, and model registries
- [**prompt-engineer**](agents/prompt-engineer.md) - Optimizes prompts for LLMs and AI systems

### Infrastructure & Operations
- [**database-optimizer**](agents/database-optimizer.md) - Optimize SQL queries, design efficient indexes, and handle database migrations
- [**deployment-engineer**](agents/deployment-engineer.md) - Configure CI/CD pipelines, Docker containers, and cloud deployments

### Specialized Domains
- [**api-documenter**](agents/api-documenter.md) - Create OpenAPI/Swagger specs and write developer documentation
- [**context-manager**](agents/context-manager.md) - Manages context across multiple agents and long-running tasks


## Other
- I also use [ccnotify](https://github.com/dazuiba/CCNotify) to get pings when stuff is done. (Mac only)

## References

- [Claude Code official document](https://docs.anthropic.com/en/docs/claude-code/overview) - must read official document.
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) - curated list of slash-commands, CLAUDE.md files, CLI tools, and other resources.
- [wshobson/agents](https://github.com/wshobson/agents) - comprehensive collection of specialized AI subagents for Claude Code.
- [feiskyer/claude-code-settings](https://github.com/feiskyer/claude-code-settings) - provided several agents / commands
