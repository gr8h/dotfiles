# Dotfiles Management with GNU Stow

This repository contains my personal dotfiles, managed using GNU Stow.

## Prerequisites

Install GNU Stow using Homebrew:

```bash
brew install stow
```

## Adding New Dotfiles

1. Copy your dotfile to the repository:
   ```bash
   cp ~/.zshrc .
   ```

2. Backup existing dotfile (recommended):
   ```bash
   mv ~/.zshrc ~/.zshrc.bak
   ```

3. List files in dotfiles directory:
   ```bash
   ls -lah
   ```

## Using Stow

### Basic Usage
To create symlinks for all dotfiles:
```bash
stow .
```

### Advanced Usage
To adopt existing configuration files:
```bash
stow --adopt .
```

The `--adopt` flag is useful when you want to move existing configuration files into your dotfiles repository. When you use `--adopt`:
- It will move the existing target file into your dotfiles directory
- Create the appropriate symlink back to the original location
- This is helpful when you want to add existing configurations to version control without manually copying files

**Note**: Be careful with `--adopt` as it will overwrite files in your dotfiles directory if they already exist. Always make backups before using this option.
