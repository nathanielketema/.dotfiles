#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(find \
        "$HOME/" \
        "$HOME/personal/" \
        "$HOME/school/" \
        "$HOME/work/" \
        "$HOME/.dotfiles/" \
        "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/" \
        "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/" \
        "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Notes" \
        "$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/second_brain/Files" \
        "$HOME/Library/Mobile Documents/com~apple~CloudDocs/School/2-Spring 2025/" \
        -mindepth 1 -maxdepth 1 -type d 2>/dev/null | fzf)
fi

if [[ -z "$selected" ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr '. ' '_')

if [[ -z "$TMUX" ]] && ! grep -x tmux > /dev/null; then
    tmux new-session -s "$selected_name" -c "$selected"
    exit 0
fi

if ! tmux has-session -t="$selected_name" 2>/dev/null; then
    tmux new-session -ds "$selected_name" -c "$selected"
fi

if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$selected_name"
else
    tmux attach-session -t "$selected_name"
fi
