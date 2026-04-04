# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

eval "$(zoxide init zsh)"

export XDG_CONFIG_HOME=$HOME/.config
export EDITOR="/opt/homebrew/bin/nvim"
export C_INCLUDE_PATH="/usr/local/include"
export VISUAL="/opt/homebrew/bin/nvim"
export GIT_EDITOR="nvim"
export DOTFILES="$HOME/.dotfiles/"
export HOMEBREW_NO_ENV_HINTS=1
export ZVM_INSTALL="$HOME/.zvm/self"

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

addToPathFront /opt/homebrew/opt/curl/bin
addToPathFront /opt/homebrew/opt/postgresql@16/bin
addToPathFront $HOME/.zig/
addToPathFront $HOME/.outfieldr/zig-out/bin/              # zldr
addToPathFront $HOME/.local/bin/
addToPathFront $HOME/.cargo/bin/
addToPathFront $HOME/.zvm/bin
addToPathFront $HOME/personal/scripts/
addToPathFront $ZVM_INSTALL

alias .nvim="cd $HOME/.config/nvim/; vim"
alias .zshrc="vim ~/.zshrc"
alias ell="eza --long --tree --level 2 --icons --git --all"
alias els="eza --tree --level 2 --icons --git"
alias gitllog="git log --graph --oneline --decorate --all"
alias gitlog="git --no-pager log --graph --oneline --decorate --all"
alias grep="grep --color=auto"
alias oldnotes="cd ~/Documents/Notes/; vim"
alias pf="fzf --preview='bat --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias vim='nvim'

alias tom250="ssh b2320@cs.dsunix.net"   # Computer Science 250
alias tom300="ssh g2431@code.dsunix.net" # Data structures
alias tom314="ssh e2436@code.dsunix.net" # Assembly Language
alias tom310="ssh c2417@code.dsunix.net" # Advanced Data Structures
alias tom410="ssh f2528@code.dsunix.net" # Parallel Computing

# Reload Zsh Profile
function s() {
  source ~/.zshrc
  source ~/.zprofile
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
bindkey '^J' sessionizer_jump_widget

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
