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

#addToPath $HOME/.zig

# tmux sessionizer
sessionizer-widget() {
  zle -I  # clear any pending input
  '/Users/nathaniel/.tmux/.tmux-sessionizer.sh'
  zle reset-prompt  # refresh prompt after script runs
}
zle -N sessionizer-widget
bindkey '^F' sessionizer-widget

sessionizer-jump-widget() {
  zle -I  # clear any pending input
  '/Users/nathaniel/.tmux/.tjump.sh'
  zle reset-prompt  # refresh prompt after script runs
}
zle -N sessionizer-jump-widget
bindkey '^O' sessionizer-jump-widget


# Q post block. Keep at the bottom of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zprofile.post.zsh"
# Add .NET Core SDK tools
export PATH="$PATH:/Users/nathaniel/.dotnet/tools"
