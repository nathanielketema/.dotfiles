#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find \
        "$HOME/" \
        "$HOME/personal/" \
        "$HOME/school/" \
        "$HOME/work/" \
        "$HOME/.dotfiles/" \
        "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/" \
        "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Notes" \
        "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Files" \
        "$HOME/Library/Mobile Documents/com~apple~CloudDocs/School/2-Spring 2025/" \
        -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z "$selected" ]]; then
    echo "No directory selected."
    exit 0
fi

selected_name=$(basename "$selected" | tr '. ' '__')

# Create the session if it doesn't exist
if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    echo "Creating tmux session '$selected_name' in directory '$selected'"

    if [ -d "$selected/.git" ]; then
        # Git repo: window 0 = lazygit, window 1 = shell
        tmux new-session -ds "$selected_name" -c "$selected" "lazygit"
        tmux rename-window -t "$selected_name:0" "lazygit"
        tmux set-window-option -t "$selected_name:0" automatic-rename off

        tmux new-window -t "$selected_name:" -n "shell" -c "$selected"
        tmux set-window-option -t "$selected_name:1" automatic-rename off
    else
        # Not a git repo: just open a shell
        tmux new-session -ds "$selected_name" -c "$selected"
        tmux rename-window -t "$selected_name:0" "shell"
        tmux set-window-option -t "$selected_name:0" automatic-rename off
    fi
fi

# Attach or switch — but default to window 1 if it exists
if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$selected_name"
    tmux select-window -t "$selected_name:1" 2>/dev/null || tmux select-window -t "$selected_name:0"
else
    tmux attach-session -t "$selected_name" \; select-window -t "$selected_name:1" \; select-window -t "$selected_name:1" 2>/dev/null || tmux select-window -t "$selected_name:0"
fi
