# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
export ZSH_CACHE_DIR="$HOME/.oh-my-zsh/cache"

# Use the Robby Russell Theme
ZSH_THEME="robbyrussell"

# Plugins
plugins=(
  git
  zsh-interactive-cd
  docker
  terraform
  node
)

# Autosuggestions and syntax highlighting (improved visibility)
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#ffffff,bold'
export ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets cursor)

# Declare associative array for syntax highlighting styles
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[comment]='fg=cyan'
ZSH_HIGHLIGHT_STYLES[command]='fg=white,bold'

# Optimize Zsh startup speed
autoload -U compinit && compinit

# Terraform autocomplete
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# Aliases for productivity
alias ll='ls -lah --color=auto'
alias vi='nvim'
alias vim='nvim'
alias reload='source ~/.zshrc'
alias refresh='bash ~/.config/nvim/install.sh'
alias setup='bash ~/.config/nvim/install.sh'
alias t='tmux attach || tmux new -s main'
alias mux='tmuxinator'
alias gco='git checkout'
alias gs='git status'
alias gl='git pull'
alias gp='git push'
alias gc='git commit -m'

# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Homebrew & fzf setup
export PATH="/opt/homebrew/bin:$PATH"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Fix PATH duplication issue
export PATH="$(echo $PATH | awk -v RS=: -v ORS=: '!seen[$0]++')"

# Default editor
export EDITOR=nvim
export VISUAL=nvim

# # Tmux auto-start
# if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
#   tmux attach || tmux new -s main
# fi

# Ensure Homebrew env (helps inside tmux too)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# zsh-autosuggestions
if [[ -f "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ]]; then
  source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
fi

# zsh-syntax-highlighting should be sourced last
if [[ -f "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
fi

source $ZSH/oh-my-zsh.sh

complete -o nospace -C /usr/bin/terraform terraform

# Added by Windsurf
export PATH="/Users/sunnybharne/.codeium/windsurf/bin:$PATH"


# Created by `pipx` on 2025-10-08 21:29:22
export PATH="$PATH:/Users/sunnybharne/.local/bin"
export REPOSITORY_PATH="/Users/sunnybharne/.config/nvim"
