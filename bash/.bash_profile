# Environment Variables
export COLORTERM=truecolor
export ZVM_INSTALL="$HOME/.zvm/self"

addToPathFront() {
    if [[ ":$PATH:" != *":$1:"* ]]; then
        export PATH="$1:$PATH"
    fi
}

addToPathFront $HOME/.zig/
addToPathFront $HOME/neovim/build/bin
addToPathFront $HOME/.zvm/bin
addToPathFront $ZVM_INSTALL

# Key bindings
sessionizer_widget() {
    "$HOME/.tmux/.tmux_sessionizer.sh"
    READLINE_LINE="$READLINE_LINE"
}

sessionizer_jump_widget() {
    "$HOME/.tmux/.tjump.sh"
    READLINE_LINE="$READLINE_LINE"
}
bind -x '"\C-f": sessionizer_widget'
bind -x '"\C-j": sessionizer_jump_widget'

alias lgit='lazygit'
alias vim='nvim'
alias gitlog='git --no-pager log --graph --oneline --decorate --all'
alias gitllog='git log --graph --oneline --decorate --all'
alias src='source $HOME/.bash_profile'
