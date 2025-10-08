# My Claude Code Dotfiles

Hey all! Just stashing my personal collection of dotfiles for Claude Code that I'm using. Some are made by me, some are yoinked from others and modified and some might just be yoinked. 

## Commands

### Development Workflow

- [`/bunify-scripts`](commands/user/bunify-scripts.md) - Convert shell scripts to Bun TypeScript scripts
- [`/changelog [version or date range]`](commands/user/changelog.md) - Generate comprehensive changelog from git commits
- [`/commit`](commands/user/commit.md) - Smart commit with generated message and push
- [`/commit-and-push`](commands/user/commit-and-push.md) - Smart commit with generated message and push
- [`/optimize`](commands/user/optimize.md) - Analyze code performance and suggest optimizations
- [`/todo`](commands/user/todo.md) - Manage project todos in todos.md file
- [`/visualize <target>`](commands/user/visualize.md) - Generate explanatory diagrams from code and architecture
- [`/workflow-automate`](commands/user/workflow-automate.md) - Create efficient CI/CD pipelines and automated development processes

### Analysis & Reflection

- [`/think [problem]`](commands/user/think.md) - Basic analytical thinking
- [`/think-harder [problem]`](commands/user/think-harder.md) - Enhanced analytical thinking
- [`/think-ultra [complex problem]`](commands/user/think-ultra.md) - Ultra-comprehensive analysis
- [`/ultrathink <task>`](commands/user/ultrathink.md) - Use 4 agents to evaluate a coding pow-wow
- [`/reflection`](commands/user/reflection.md) - Analyze and improve Claude Code instructions
- [`/reflection-harder`](commands/user/reflection-harder.md) - Comprehensive session analysis and learning
- [`/full-review`](commands/user/full-review.md) - Comprehensive multi-perspective code review using specialized agents
- [`/multi-agent-review`](commands/user/multi-agent-review.md) - Multi-agent code review with specialized reviewers
- [`/performance-optimization`](commands/user/performance-optimization.md) - End-to-end application performance optimization
- [`/multi-agent-optimize`](commands/user/multi-agent-optimize.md) - Optimize application stack using specialized optimization agents
- [`/tech-debt`](commands/user/tech-debt.md) - Technical debt analysis and remediation

### Problem Solving

- [`/findoptions`](commands/user/findoptions.md) - Analyze different approaches for a task or problem
- [`/five`](commands/user/five.md) - Use the five why's process to evaluate issues
- [`/summary`](commands/user/summary.md) - Generate comprehensive summaries from current chat

### Documentation & Knowledge

- [`/create-command [name] [description]`](commands/user/create-command.md) - Create new Claude Code commands
- [`/improve-agent`](commands/user/improve-agent.md) - Analyze and improve existing agents based on performance patterns
- [`/context-save`](commands/user/context-save.md) - Save current project context for future agent coordination
- [`/context-restore`](commands/user/context-restore.md) - Restore saved project context for agent coordination

### Development Tools

- [`/api-mock`](commands/user/tools/api-mock.md) - API mocking framework for development and testing


## Agent Management System

The agent system has been restructured for efficient context management. Instead of loading all 40 agents every time, you can now use project-specific presets that only load relevant agents.

### Directory Structure
```
~/.claude/
├── agents/                 # Active agents (symlinks only - not tracked in git)
├── agents-library/         # Full agent library organized by category
│   ├── dev/               # Development & language specialists (10 agents)
│   ├── review/            # Code review specialists (3 agents)
│   ├── ops/               # DevOps & infrastructure (6 agents)
│   ├── analysis/          # Analysis & thinking agents (6 agents)
│   └── specialized/       # Specialized & utility agents (15 agents)
├── presets/               # Project-specific agent configurations
└── bin/                   # Agent management scripts
```

### Quick Start

```bash
# Apply project-specific presets
~/.claude/bin/agent preset typescript    # TypeScript/React development
~/.claude/bin/agent preset python       # Python/ML/data science  
~/.claude/bin/agent preset php          # PHP/WordPress development
~/.claude/bin/agent preset fullstack    # Full-stack development
~/.claude/bin/agent preset devops       # Infrastructure/deployment
~/.claude/bin/agent preset review       # Code review focused
~/.claude/bin/agent preset analysis     # Deep analysis & thinking
~/.claude/bin/agent preset minimal      # Just essentials

# Individual agent management
~/.claude/bin/agent enable database-expert
~/.claude/bin/agent disable python-expert

# View status and available options
~/.claude/bin/agent list                # Show all agents and status
~/.claude/bin/agent presets            # List available presets
~/.claude/bin/agent active             # Show only active agents
```

### Available Presets

| Preset | Agents | Use Case |
|--------|--------|----------|
| **typescript** | 4 agents | TypeScript/React projects |
| **python** | 5 agents | Python/ML/data science |
| **php** | 4 agents | PHP/WordPress development |
| **fullstack** | 6 agents | Full-stack applications |
| **devops** | 5 agents | Infrastructure/deployment |
| **review** | 3 agents | Code review sessions |
| **analysis** | 5 agents | Deep thinking/analysis |
| **minimal** | 1 agent | Lightweight sessions |

### Context Benefits

- **90% context reduction**: Load 4-6 relevant agents instead of all 40
- **Project-specific**: TypeScript projects don't load Python/PHP agents  
- **Quick switching**: One command changes entire agent configuration
- **Organized library**: All agents preserved and categorized for reference

### Agent Library

#### 📁 Development & Language Specialists (dev/)
- [**typescript-expert**](agents-library/dev/typescript-expert.md) - Advanced TypeScript, generics, utility types
- [**javascript-pro**](agents-library/dev/javascript-pro.md) - Modern JavaScript, ES6+, Node.js APIs
- [**python-expert**](agents-library/dev/python-expert.md) - Idiomatic Python, decorators, async/await
- [**php-pro**](agents-library/dev/php-pro.md) - Modern PHP, performance optimizations
- [**nextjs-app-router-developer**](agents-library/dev/nextjs-app-router-developer.md) - Next.js App Router, Server Components
- [**ui-engineer**](agents-library/dev/ui-engineer.md) - UI/UX development, responsive design
- [**wordpress-developer**](agents-library/dev/wordpress-developer.md) - Custom themes, plugins, WordPress
- [**database-expert**](agents-library/dev/database-expert.md) - Complex SQL, schema design, optimization
- [**ml-platform-engineer**](agents-library/dev/ml-platform-engineer.md) - ML pipelines, model serving, MLOps
- [**scrapy-web-scraping-expert**](agents-library/dev/scrapy-web-scraping-expert.md) - Web scraping, data extraction

#### 📁 Code Review Specialists (review/)
- [**typescript-react-code-reviewer**](agents-library/review/typescript-react-code-reviewer.md) - TypeScript/React code review
- [**architect-review**](agents-library/review/architect-review.md) - Architectural consistency, patterns
- [**senior-dev-test-architect**](agents-library/review/senior-dev-test-architect.md) - Code review, refactoring, testing

#### 📁 DevOps & Infrastructure (ops/)
- [**devops-platform-engineer**](agents-library/ops/devops-platform-engineer.md) - Cloud infrastructure, platform reliability
- [**deployment-engineer**](agents-library/ops/deployment-engineer.md) - CI/CD pipelines, Docker, deployments
- [**cloud-run-specialist**](agents-library/ops/cloud-run-specialist.md) - Google Cloud Run deployments
- [**data-engineer**](agents-library/ops/data-engineer.md) - ETL pipelines, data warehouses
- [**mcp-server-architect**](agents-library/ops/mcp-server-architect.md) - MCP server design, protocol compliance
- [**mcp-testing-engineer**](agents-library/ops/mcp-testing-engineer.md) - MCP testing, debugging, quality

#### 📁 Analysis & Thinking (analysis/)
- [**deep-thinker**](agents-library/analysis/deep-thinker.md) - Enhanced analytical thinking
- [**ultra-thinker**](agents-library/analysis/ultra-thinker.md) - Ultra-comprehensive analysis
- [**strategic-analyst-ideator**](agents-library/analysis/strategic-analyst-ideator.md) - Market research, competitive analysis
- [**business-analyst**](agents-library/analysis/business-analyst.md) - Metrics, reports, KPI tracking
- [**data-scientist**](agents-library/analysis/data-scientist.md) - Data analysis, SQL, BigQuery
- [**deep-reflector**](agents-library/analysis/deep-reflector.md) - Session analysis, learning capture

#### 📁 Specialized & Utilities (specialized/)
- [**ai-engineer**](agents-library/specialized/ai-engineer.md) - LLM applications, RAG systems
- [**api-documenter**](agents-library/specialized/api-documenter.md) - OpenAPI specs, developer docs
- [**agent-expert**](agents-library/specialized/agent-expert.md) - Create/optimize Claude Code agents
- [**command-creator**](agents-library/specialized/command-creator.md) - Create custom Claude Code commands
- [**context-manager**](agents-library/specialized/context-manager.md) - Multi-agent task coordination
- [**dx-optimizer**](agents-library/specialized/dx-optimizer.md) - Developer experience, tooling workflows
- [**instruction-reflector**](agents-library/specialized/instruction-reflector.md) - Improve Claude Code instructions
- [**insight-documenter**](agents-library/specialized/insight-documenter.md) - Technical breakthrough documentation
- [**legacy-modernization-specialist**](agents-library/specialized/legacy-modernization-specialist.md) - System modernization, migrations
- [**product-owner-process-steward**](agents-library/specialized/product-owner-process-steward.md) - Product artifacts, documentation
- [**prompt-engineer**](agents-library/specialized/prompt-engineer.md) - LLM prompt optimization
- [**tutorial-engineer**](agents-library/specialized/tutorial-engineer.md) - Educational content, tutorials
- [**ux-ui-designer**](agents-library/specialized/ux-ui-designer.md) - User experience design
- [**command-expert**](agents-library/specialized/command-expert.md) - CLI commands, automation tooling
- [**get-current-datetime**](agents-library/specialized/get-current-datetime.md) - Date/time utilities


## Other
- I also use [ccnotify](https://github.com/dazuiba/CCNotify) to get pings when stuff is done. (Mac only)

## References

- [Claude Code official document](https://docs.anthropic.com/en/docs/claude-code/overview) - must read official document.
- [awesome-claude-code](https://github.com/hesreallyhim/awesome-claude-code) - curated list of slash-commands, CLAUDE.md files, CLI tools, and other resources.
- [wshobson/agents](https://github.com/wshobson/agents) - comprehensive collection of specialized AI subagents for Claude Code.
- [feiskyer/claude-code-settings](https://github.com/feiskyer/claude-code-settings) - provided several agents / commands
