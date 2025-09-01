#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
    selected="$1"
else
    selected=$(find \
        "$HOME/" \
        "$HOME/personal/" \
        "$HOME/personal/MindEase/" \
        "$HOME/school/" \
        "$HOME/work/" \
        "$HOME/.dotfiles/" \
        "$HOME/second-brain/" \
        "$HOME/second-brain/notes/" \
        "$HOME/second-brain/files/" \
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
    tmux new-session -ds "$selected_name" -c "$selected" -n "$selected_name"
fi

if [[ -n "$TMUX" ]]; then
    tmux switch-client -t "$selected_name"
else
    tmux attach-session -t "$selected_name"
fi
