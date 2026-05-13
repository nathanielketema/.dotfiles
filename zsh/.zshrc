export ZSH="$HOME/.oh-my-zsh"
export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="/opt/homebrew/bin/nvim"
export C_INCLUDE_PATH="/usr/local/include"
export VISUAL="/opt/homebrew/bin/nvim"
export GIT_EDITOR="nvim"
export DOTFILES="$HOME/.dotfiles/"
export HOMEBREW_NO_ENV_HINTS=1

# oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(zsh-autosuggestions zsh-syntax-highlighting web-search vi-mode)
source $ZSH/oh-my-zsh.sh

ZVM_INSTALL="$HOME/.zvm/self"

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init --cmd cd zsh)"

[ -f $HOME/.fzf.zsh ] && source ~/.fzf.zsh

function addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

function addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

function note() {
    cd "$HOME/personal/notes/inbox/"
    nvim "$1.md"
}

function new_latex() {
    mkdir "./$1";
    cd "./$1";
    nvim "$1.tex"
}

function sessionizer_widget() {
  zle -I
  tmux_sessionizer
  zle reset-prompt
}
zle -N sessionizer_widget
bindkey '^F' sessionizer_widget

function sessionizer_jump_widget() {
  zle -I
  tmux_jump
  zle reset-prompt
}
zle -N sessionizer_jump_widget
bindkey '^O' sessionizer_jump_widget

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

addToPathFront /opt/homebrew/opt/curl/bin
addToPathFront /opt/homebrew/opt/postgresql@16/bin
addToPathFront $HOME/.outfieldr/zig-out/bin              # zldr
addToPathFront $HOME/.local/bin
addToPathFront $HOME/.cargo/bin
addToPathFront $HOME/.zvm/bin
addToPathFront $HOME/personal/scripts
addToPathFront $ZVM_INSTALL

alias "?"="opencode run --model openai/gpt-5.4-mini-fast"
alias oc="opencode"
alias sk="sioyek"
alias s="source $HOME/.zshrc"
alias ell="eza --long --tree --level 2 --icons --git --all"
alias els="eza --tree --level 2 --icons --git"
alias gitllog="git log --graph --oneline --decorate --all"
alias gitlog="git --no-pager log --graph --oneline --decorate --all"
alias grep="grep --color=auto"
alias pf="fzf --preview='bat --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias vim='nvim'

alias tom250="ssh b2320@cs.dsunix.net"   # Computer Science 250
alias tom300="ssh g2431@code.dsunix.net" # Data structures
alias tom314="ssh e2436@code.dsunix.net" # Assembly Language
alias tom310="ssh c2417@code.dsunix.net" # Advanced Data Structures
alias tom410="ssh f2528@code.dsunix.net" # Parallel Computing
