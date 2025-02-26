# Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.

export EDITOR="/opt/homebrew/bin/nvim"
export ZSH="$HOME/.oh-my-zsh"
export C_INCLUDE_PATH="/usr/local/include"
export VISUAL="/opt/homebrew/bin/nvim"


export PATH="/opt/homebrew/opt/tcl-tk/bin:$PATH"
export LDFLAGS="-L/opt/homebrew/opt/tcl-tk/lib"
export CPPFLAGS="-I/opt/homebrew/opt/tcl-tk/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/tcl-tk/lib/pkgconfig"
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

bindkey -v
export KEYTIMEOUT=1

#source <(fzf --zsh)

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting web-search vi-mode)

source $ZSH/oh-my-zsh.sh


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# Aliases

alias ll="ls -lth"
alias vim='nvim'
alias mu="mupdf-gl"
alias pf="fzf --preview='bat --color=always {}' --bind shift-up:preview-page-up,shift-down:preview-page-down"
alias so="source"
alias grep="grep --color=auto"
alias lgit="lazygit"
alias gitlog="git log --graph --oneline --decorate --all"

# Class folders
alias sp24="cd /Users/nathaniel/Library/Mobile\ Documents/com~apple~CloudDocs/School/1-Spring\ 2024"
alias fall24="cd /Users/nathaniel/Library/Mobile\ Documents/com~apple~CloudDocs/School/2-Fall\ 2024"
alias sp25="cd /Users/nathaniel/Library/Mobile\ Documents/com~apple~CloudDocs/School/2-Spring\ 2025"
#
# Tom's classes
alias tom250="ssh b2320@cs.dsunix.net" # Computer Science 250
alias tom300="ssh g2431@code.dsunix.net" # Data structures
alias tom314="ssh e2436@code.dsunix.net" # Assembly Language
alias tom310="ssh c2417@code.dsunix.net" # Advanced Data Structures

alias oldnotes="cd ~/Documents/Notes/; vim"

## source files
alias .nvim="cd ~/.config/nvim/; vim"
alias .zshrc="vim ~/.zshrc"

## second_brain
alias brain="cd /Users/nathaniel/Library/Mobile\ Documents/iCloud~md~obsidian/Documents/second_brain; vim"


function note() {
    cd "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Inbox/";
    nvim "$1.md"
}

function latex() {
    mkdir "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Latex Projects/$1";
    cd "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Latex Projects/$1";
    nvim "$1.tex"
}

function c() {
    mkdir "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_cpp/$1";
    cd "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_cpp/$1";
    nvim "$1.c"
}

function cpp() {
    mkdir "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_cpp/$1";
    cd "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_cpp/$1";
    nvim "$1.cpp"
}

function csharp() {
    mkdir "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_c-sharp/$1";
    cd "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_c-sharp/$1";
    nvim "$1.cs"
}

function python() {
    mkdir "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_cpp/$1";
    cd "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Coding Workspaces/workspace_cpp/$1";
    nvim "$1.py"
}

function journal() {
    cd "/Users/nathaniel/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Journal/";
    nvim "$1.md"
}

export PATH="/opt/homebrew/opt/curl/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"
export PATH="/opt/homebrew/opt/sphinx-doc/bin:$PATH"


[[ -f "$HOME/fig-export/dotfiles/dotfile.zsh" ]] && builtin source "$HOME/fig-export/dotfiles/dotfile.zsh"

# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
