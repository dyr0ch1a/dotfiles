#!/bin/bash
if ! tmux has-session -t music 2>/dev/null; then
    tmux new-session -d -s music
    tmux send-keys -t music 'mocp' Enter
    tmux split-window -v -t music
    tmux send-keys -t music 'cava' Enter
fi
tmux attach-session -t music
