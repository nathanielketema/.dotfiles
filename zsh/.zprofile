# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

VIM="nvim"

export XDG_CONFIG_HOME=$HOME/.config

export EDITOR="/opt/homebrew/bin/nvim"
export C_INCLUDE_PATH="/usr/local/include"
export VISUAL="/opt/homebrew/bin/nvim"
export GIT_EDITOR="$VIM"
export DOTFILES="$HOME/.dotfiles/"
export HOMEBREW_NO_ENV_HINTS=1

export ZVM_INSTALL="$HOME/.zvm/self"

addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPathFront $HOME/.zig/
addToPathFront /opt/homebrew/opt/postgresql@16/bin
addToPathFront $HOME/.outfieldr/zig-out/bin/ # zldr
addToPathFront $HOME/.local/bin/
addToPathFront $HOME/.cargo/bin/
addToPathFront $HOME/.zvm/bin
addToPathFront $ZVM_INSTALL
addToPathFront $HOME/.bun/bin/
addToPathFront $HOME/personal/scripts/

alias els="eza --tree --level 2 --icons --git"
alias ell="eza --long --tree --level 2 --icons --git --all"
alias vim='nvim'
alias pf="fzf --preview='bat --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias grep="grep --color=auto"
alias lgit="lazygit"
alias gitlog="git --no-pager log --graph --oneline --decorate --all"
alias gitllog="git log --graph --oneline --decorate --all"
alias oldnotes="cd ~/Documents/Notes/; vim"
alias .nvim="cd $HOME/.config/nvim/; vim"
alias .zshrc="vim ~/.zshrc"
alias brain="cd ~/second-brain/"
alias pdfslide="pympress"

alias tom250="ssh b2320@cs.dsunix.net" # Computer Science 250
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
    cd "$HOME/personal/second-brain/notes/inbox/"
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

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
