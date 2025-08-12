---
description: Synchronize README.md with actual agent and command files
argument-hint: No arguments required - analyzes current directory structure
allowed-tools: Read, Write, LS, Glob, Grep, Bash
---

# README Sync Command

Intelligently synchronizes the README.md file with the actual agents and commands in the repository. Analyzes git status to identify new, modified, or deleted files, then updates the README.md to reflect the current state while preserving existing structure and formatting.

## Usage:

`/readme-sync`

## Process:

1. **Git Status Analysis**: Check for new, modified, or deleted agent and command files
2. **File Discovery**: Scan agents/ and commands/ directories for all .md files
3. **Content Extraction**: Extract descriptions from frontmatter and content headers
4. **README Analysis**: Parse current README.md structure and categorization
5. **Intelligent Updates**: Add missing entries, remove deleted ones, preserve existing order
6. **Structure Preservation**: Maintain existing categories and formatting patterns

## Behavior:

### For Agent Files:
- Extracts `description` field from frontmatter
- Uses `category` field to determine proper README section placement
- Falls back to content analysis if frontmatter is missing
- Format: `[**agent-name**](agents/agent-name.md) - Description`
- **IMPORTANT**: Description should be a single line without escaped characters, examples, or markup

### For Command Files:
- Extracts description from frontmatter or analyzes content
- Categorizes based on file path and content analysis
- Handles nested directories (e.g., commands/user/tools/)
- Format: `[/command-name](commands/user/command-name.md) - Description`

### Smart Categorization:
- **Analysis & Documentation**: reflection, analysis, documentation agents
- **Development & Engineering**: UI, dev, engineering-focused agents
- **Product & Process**: business, product, process agents  
- **Language Specialists**: language-specific programming agents
- **Data & AI**: ML, AI, data processing agents
- **Infrastructure & Operations**: deployment, ops, platform agents
- **Quality & Security**: testing, security, architecture agents
- **Specialized Domains**: niche or specific domain agents

### Command Categories:
- **Development Workflow**: build, deploy, commit, optimization commands
- **Analysis & Reflection**: thinking, analysis, review commands
- **Problem Solving**: problem analysis and solution commands
- **Documentation & Knowledge**: documentation and knowledge management
- **Development Tools**: utility and tool commands

## Examples:

**Adding a new agent:**
- File: `agents/mobile-app-developer.md`
- Frontmatter: `description: Build native mobile apps with React Native and Expo`
- Result: Added to "Development & Engineering" section

**Adding a new command:**
- File: `commands/user/database-migrate.md` 
- Content analysis suggests database operations
- Result: Added to "Development Tools" section

**Removing deleted files:**
- Git status shows `D agents/old-agent.md`
- Result: Entry removed from README.md

## YAML Formatting Guidelines:

When generating or updating agent/command descriptions:
- **Single line descriptions** - No multi-line strings or escaped characters
- **No embedded examples** - Examples belong in the body, not the description
- **Clean YAML** - No `\n`, `\\`, or HTML/XML tags in descriptions
- **Concise and clear** - Focus on what the agent/command does
- **Include "Use PROACTIVELY"** when appropriate for agents
- **Add category field** for agents to enable proper organization

Example of CORRECT format:
```yaml
---
name: ui-engineer
description: Expert UI/frontend developer for creating and reviewing frontend code. Use PROACTIVELY for UI/UX implementation.
category: development-engineering
---
```

Example of INCORRECT format (avoid):
```yaml
description: Agent for UI work\n\n<example>user: "help"</example>
```

## Notes:

- Preserves all existing content and custom formatting
- Maintains alphabetical order within sections
- Does not modify sections that haven't changed
- Provides summary of changes made
- Handles edge cases like missing frontmatter gracefully
- Respects existing manual customizations in descriptions
- Cleans up improperly formatted YAML descriptions when found

$ARGUMENTS

---

I'll analyze the current git status and directory structure to synchronize the README.md with your actual agent and command files.

## Step 1: Analyzing Git Status and Current Structure

Let me first check what files have been added, modified, or deleted:

```bash
git status --porcelain
```

This will show me the current state of files that need to be synchronized.

## Step 2: Discovering All Agent and Command Files

I'll scan the agents/ and commands/ directories to get a complete inventory:

```bash
find agents/ -name "*.md" -type f | sort
find commands/ -name "*.md" -type f | sort
```

## Step 3: Extracting Metadata from Files

For each file found, I'll extract:
- **Frontmatter descriptions** (preferred source)
- **Category information** from agents
- **Content-based descriptions** as fallback
- **File modification status** from git

## Step 4: Analyzing Current README Structure

I'll parse the existing README.md to understand:
- Current section organization
- Existing entries and their format
- Custom formatting or additional content
- Section boundaries and ordering

## Step 5: Intelligent Updates

Based on the analysis, I'll:

### Add New Entries:
- **New agent files** → Categorized by `category` field or content analysis
- **New command files** → Categorized by path and purpose analysis
- **Modified files** → Update descriptions if changed

### Remove Obsolete Entries:
- **Deleted files** → Remove corresponding README entries
- **Moved files** → Update paths and reorganize if needed

### Preserve Existing Structure:
- **Section headers** → Keep existing categorization
- **Custom content** → Maintain any manual additions
- **Formatting** → Follow established patterns
- **Ordering** → Preserve within-section organization

## Step 6: Generate Updated README

The final README.md will:
- Maintain existing structure and flow
- Include all current agents and commands
- Remove references to deleted files
- Preserve custom formatting and content
- Follow established link and description patterns

Let me start the synchronization process: