set --global --export XDG_CONFIG_HOME $HOME/.config
set --global --export EDITOR nvim
set --global --export VISUAL $EDITOR
set --global --export GIT_EDITOR nvim
set --global --export DOTFILES $HOME/.dotfiles
set --global --export HOMEBREW_NO_ENV_HINTS 1
set --global --export C_INCLUDE_PATH /usr/local/include
set --global --export FZF_CTRL_T_COMMAND "fd --type f"

# Remove greeting
set --global fish_greeting

fish_add_path $HOME/personal/scripts
fish_add_path $HOME/.zvm/self
fish_add_path $HOME/.zvm/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/.local/bin
fish_add_path $HOME/go/bin/
fish_add_path $HOME/.outfieldr/zig-out/bin # zldr
fish_add_path $HOME/git-clone/zignal/zig-out/bin
fish_add_path $HOME/git-clone/zig/build/stage3/bin
fish_add_path /opt/homebrew/opt/postgresql@16/bin
fish_add_path /opt/homebrew/opt/curl/bin

/opt/homebrew/bin/brew shellenv | source
fzf --fish | source
fish_user_key_bindings

abbr pomo pomo.zig
abbr config config.zig
abbr mtp mtp.zig
abbr ctp ctp.zig
abbr ell "eza --long --tree --level 2 --icons --git --all"
abbr els "eza --tree --level 2 --icons --git"
abbr gitllog "git log --graph --oneline --decorate --all"
abbr gitlog "git --no-pager log --graph --oneline --decorate --all"
abbr oc opencode
abbr s "source $HOME/.config/fish/config.fish"
abbr sk sioyek
abbr vim nvim
abbr y yazi

alias "?" "opencode run --model google/gemini-3.5-flash"
alias grep "grep --color=auto"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
test -r '/Users/nathaniel/.opam/opam-init/init.fish' && source '/Users/nathaniel/.opam/opam-init/init.fish' > /dev/null 2> /dev/null; or true
# END opam configuration
