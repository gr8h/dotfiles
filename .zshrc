# =============================================================================
# SETUP
# =============================================================================
# Symlink: ln -s ~/dotfiles/.zshrc ~/.zshrc
# Symlink: ln -s ~/dotfiles/.config/wezterm ~/.config/wezterm
# Symlink: ln -s ~/dotfiles/.wezterm.lua ~/.wezterm.lua
# VSCode/Antigravity setup: See ~/dotfiles/.config/code/README.md
# =============================================================================

# =============================================================================
# SHELL CONFIGURATION
# =============================================================================
# Theme, prompt, history, and keybindings

# -- Powerlevel10k Instant Prompt (must stay near top) --
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -- Oh My Zsh --
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search)

# Settings (uncomment to enable)
# CASE_SENSITIVE="true"
# HYPHEN_INSENSITIVE="true"
# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
# ZSH_CUSTOM=/path/to/new-custom-folder

# Update behavior (uncomment one)
# zstyle ':omz:update' mode disabled
# zstyle ':omz:update' mode auto
# zstyle ':omz:update' mode reminder
# zstyle ':omz:update' frequency 13

source $ZSH/oh-my-zsh.sh
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# -- History --
HISTFILE=$HOME/.zhistory
HISTSIZE=999
SAVEHIST=1000
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# -- Keybindings --
bindkey -v                            # Vim mode
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# =============================================================================
# ENVIRONMENT
# =============================================================================
# Editor and general environment variables

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Uncomment to enable:
# export LANG=en_US.UTF-8
# export MANPATH="/usr/local/man:$MANPATH"
# export ARCHFLAGS="-arch $(uname -m)"

# =============================================================================
# PATH
# =============================================================================

# -- Homebrew --
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"
export PATH="/opt/homebrew/opt/llvm/bin:$PATH"

# -- Development Tools --
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
export PATH="$HOME/gr8h/Repos/nufflelabs/nuff/target/release:$PATH"
export PATH="$HOME/.antigravity/antigravity/bin:$PATH"

# -- Applications --
export PATH="/Applications/Windsurf.app/Contents/MacOS:$PATH"
export PATH="$HOME/.codeium/windsurf/bin:$PATH"

# =============================================================================
# TOOLS
# =============================================================================
# Tool-specific initialization and configuration

# -- NVM (Node Version Manager) --
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# -- Zoxide (smart cd) --
eval "$(zoxide init zsh)"

# =============================================================================
# ALIASES
# =============================================================================

alias cd="z"                          # Zoxide
alias ls="eza --icons=always"         # Eza (better ls)
alias wind="Electron"                 # Windsurf
