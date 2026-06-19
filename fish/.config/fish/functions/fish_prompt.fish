function __robbyrussell_git_branch
    command git symbolic-ref --quiet --short HEAD 2>/dev/null
    or command git rev-parse --quiet --short HEAD 2>/dev/null
end

function __robbyrussell_git_dirty
    not command git diff --quiet --ignore-submodules 2>/dev/null
    and return 0
    command git ls-files --others --exclude-standard --directory --no-empty-directory 2>/dev/null | string length -q
end

function fish_prompt
    set --local last_status $status
    set --local normal (set_color normal)
    set --local cyan (set_color --bold cyan)
    set --local blue (set_color --bold blue)
    set --local red (set_color --bold red)
    set --local green (set_color --bold green)
    set --local yellow (set_color --bold yellow)
    set --local arrow
    if test $last_status -eq 0
        set arrow (string join '' -- $green '➜')
    else
        set arrow (string join '' -- $red '➜')
    end
    set --local current_dir
    if test "$PWD" = "$HOME"
        set current_dir '~'
    else
        set current_dir (path basename -- "$PWD")
    end
    set --local git_info
    set --local branch (__robbyrussell_git_branch)
    if test -n "$branch"
        set git_info (string join '' -- $blue ' git:(' $red $branch $blue ')')
        if __robbyrussell_git_dirty
            set git_info (string join '' -- $git_info $yellow ' ✗')
        end
    end
    string join '' -- $arrow '  ' $cyan $current_dir $normal $git_info ' '
end
