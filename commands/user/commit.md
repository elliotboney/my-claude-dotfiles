---
title: 'Just Commit'
name: commit
type: command
---

**Important Do NOT add Claude co-authorship footer to commits**


## Task List ##
- ADD all modified and new files to git. 
    - If you think there are files that should not be in version control, ask the user.  
    - If you see files that you think should be bundled into separate commits, ask the user.
- Create a commit message following the spec later in this command.
    - Use any context from our chat to help with the message, also look at recently edited stories in `docs/stories` if they exist.
    - Do NOT PUSH this commit
    - The user is EXPLICITLY asking you to perform these git tasks.



# Conventional Commits 1.0.0 - AI Agent Reference

> **Context for AI Agents**: This is a standardized format for commit messages that enables automated tooling and clear communication of changes. When generating commits, follow these conventions to ensure compatibility with CI/CD pipelines, automated versioning, and changelog generation.

## Summary

The Conventional Commits specification is a lightweight convention on top of commit messages that provides an easy set of rules for creating an explicit commit history. This convention dovetails with [SemVer](http://semver.org) by describing features, fixes, and breaking changes in commit messages.

## Commit Message Structure

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

### Key Structural Elements

> **AI Agent Note**: Pay special attention to the type prefix as it directly correlates with semantic versioning:

- **`fix:`** - Patches a bug (correlates with PATCH in SemVer)
- **`feat:`** - Introduces a new feature (correlates with MINOR in SemVer)
- **`BREAKING CHANGE:`** - Footer or ! after type/scope indicates breaking changes (correlates with MAJOR in SemVer)

### Additional Common Types

> **AI Agent Tip**: While `fix` and `feat` are required by the spec, these additional types are widely adopted:

- `build:` - Changes to build system or dependencies
- `chore:` - Maintenance tasks, no production code change
- `ci:` - Changes to CI configuration files and scripts
- `docs:` - Documentation only changes
- `style:` - Code style changes (formatting, semicolons, etc)
- `refactor:` - Code change that neither fixes a bug nor adds a feature
- `perf:` - Performance improvements
- `test:` - Adding or correcting tests

## Common Examples

### Simple Bug Fix
```
fix: prevent race condition in user authentication

Ensure token validation completes before proceeding with
authorization checks.
```

### Feature with Scope
```
feat(api): add endpoint for bulk user import

Implements POST /api/v1/users/bulk to support importing
multiple users via CSV upload.
```

### Breaking Change
```
feat!: change default API response format to JSON

BREAKING CHANGE: API responses now default to JSON instead of XML.
Clients must update Accept headers or explicitly request XML format.
```

## Specification Rules

> **AI Agent Implementation Guide**: These are the MUST/SHALL requirements from RFC 2119:

### Required Elements

1. **Type prefix is REQUIRED**
   - Must be a noun (`feat`, `fix`, etc.)
   - Followed by optional scope, optional !, and required `: `

2. **Description is REQUIRED**
   - Short summary immediately after the colon and space
   - Example: `fix: array parsing issue when multiple spaces were contained in string`

### Optional Elements

3. **Scope MAY be provided**
   - Noun describing a section of the codebase
   - Surrounded by parentheses: `fix(parser):`

4. **Body MAY be provided**
   - Additional context about the changes
   - Must begin one blank line after description
   - Can be multiple paragraphs

5. **Footer(s) MAY be provided**
   - One blank line after body
   - Format: `<token>: <value>` or `<token> #<value>`
   - Tokens use `-` instead of spaces (except `BREAKING CHANGE`)

### Breaking Changes

> **AI Agent Critical**: Breaking changes require special handling:

- **Method 1**: Use ! before the colon: `feat!:` or `feat(api)!:`
- **Method 2**: Include `BREAKING CHANGE:` in footer
- **Both methods** can be used together for emphasis

### Important Notes

- Case insensitive (except `BREAKING CHANGE` which MUST be uppercase)
- `BREAKING-CHANGE` is synonymous with `BREAKING CHANGE` in footers
- Multiple footers are allowed

## Why Use Conventional Commits

> **AI Agent Benefits**: When you follow these conventions, you enable:

1. **Automated CHANGELOG generation** - Tools can parse commits to build release notes
2. **Automatic version bumping** - Determine next version based on commit types
3. **Clear communication** - Team members understand changes at a glance
4. **CI/CD triggers** - Automate builds and deployments based on commit types
5. **Better project history** - Structured commits make exploration easier

## Best Practices for AI Agents

1. **Be specific in descriptions** - Don't just say "fix bug", describe what was fixed
2. **Use scopes consistently** - Establish project-specific scopes (e.g., `auth`, `ui`, `db`)
3. **Include issue references** - Use footers like `Fixes: #123` or `Refs: #456`
4. **Keep first line under 72 characters** - This ensures readability in various git tools
5. **Write in imperative mood** - "add feature" not "added feature" or "adding feature"

---

> **Implementation Note**: When generating commits, ensure your output strictly follows this format to maintain compatibility with automated tooling and team workflows.
