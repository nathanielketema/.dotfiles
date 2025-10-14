# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.pre.zsh"
eval "$(/opt/homebrew/bin/brew shellenv)"

export XDG_CONFIG_HOME=$HOME/.config
VIM="nvim"

# Added by Toolbox App
export PATH="$PATH:/Users/nathaniel/Library/Application Support/JetBrains/Toolbox/scripts"

# nvim
export EDITOR="/opt/homebrew/bin/nvim"
export C_INCLUDE_PATH="/usr/local/include"
export VISUAL="/opt/homebrew/bin/nvim"
export GIT_EDITOR="$VIM"
export DOTFILES="$HOME/.dotfiles/"

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

# Path
addToPathFront $HOME/.zig/
addToPathFront /opt/homebrew/opt/postgresql@16/bin
addToPathFront $HOME/.outfieldr/zig-out/bin/

alias ll="ls -ltha"
alias ez="eza --long --tree --level=3"
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

# Class folders
alias sp24="cd /Users/nathaniel/Library/Mobile\ Documents/com~apple~CloudDocs/School/1-Spring\ 2024"
alias fall24="cd /Users/nathaniel/Library/Mobile\ Documents/com~apple~CloudDocs/School/2-Fall\ 2024"
alias sp25="cd /Users/nathaniel/Library/Mobile\ Documents/com~apple~CloudDocs/School/2-Spring\ 2025"
alias fall25="cd /Users/nathaniel/Library/Mobile\ Documents/com~apple~CloudDocs/School/3-Fall\ 2025"

# Tom's ssh aliases for his classes
alias tom250="ssh b2320@cs.dsunix.net" # Computer Science 250
alias tom300="ssh g2431@code.dsunix.net" # Data structures
alias tom314="ssh e2436@code.dsunix.net" # Assembly Language
alias tom310="ssh c2417@code.dsunix.net" # Advanced Data Structures
alias tom410="ssh f2528@code.dsunix.net" # Parallel Computing

function note() {
    cd "$HOME/second-brain/notes/inbox/"
    nvim "$1.md"
}

function new_latex() {
    mkdir "./$1";
    cd "./$1";
    nvim "$1.tex"
}

function sessionizer_widget() {
  zle -I  # clear any pending input
  '/Users/nathaniel/.tmux/.tmux_sessionizer.sh'
  zle reset-prompt  # refresh prompt after script runs
}
zle -N sessionizer_widget
bindkey '^F' sessionizer_widget

function sessionizer_jump_widget() {
  zle -I  # clear any pending input
  '/Users/nathaniel/.tmux/.tjump.sh'
  zle reset-prompt  # refresh prompt after script runs
}
zle -N sessionizer_jump_widget
bindkey '^J' sessionizer_jump_widget

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
# Add .NET Core SDK tools
export PATH="$PATH:/Users/nathaniel/.dotnet/tools"
