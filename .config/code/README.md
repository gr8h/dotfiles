# VSCode & Antigravity Shared Configuration

This directory contains unified configuration files shared by both VSCode and Antigravity editors.

## Files

- **settings.json** - Editor settings, keybindings, vim config, and AI assistant preferences
- **keybindings.json** - Custom keyboard shortcuts for terminal navigation and Claude Code
- **extensions.json** - Recommended extensions list (reference only, not auto-installed)
- **mcp.json** - MCP server configuration
- **snippets/** - Custom code snippets
- **install-extensions.sh** - Script to install extensions from extensions.json

## Setup

Both editors use the same config via symlinks:

```bash
# VSCode
ln -s ~/dotfiles/.config/code ~/Library/Application\ Support/Code/User

# Antigravity
ln -s ~/dotfiles/.config/code ~/Library/Application\ Support/Antigravity/User
```

## Usage

Any changes made in either VSCode or Antigravity will instantly sync to both editors.

To install extensions:
```bash
./install-extensions.sh
```
