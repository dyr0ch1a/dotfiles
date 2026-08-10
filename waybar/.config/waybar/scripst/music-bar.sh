#!/bin/bash

info=$(mocp --info 2>/dev/null)

state=$(echo "$info" | awk -F': ' '/^State:/ {print $2}')
cur=$(echo "$info" | awk -F': ' '/^CurrentTime:/ {print $2}')
tot=$(echo "$info" | awk -F': ' '/^TotalTime:/ {print $2}')

# защита от пустых значений
cur=${cur:-0}
tot=${tot:-0}

case "$state" in
    PLAY)
        echo "▶ ${cur} / ${tot}"
        ;;
    PAUSE)
        echo "⏸ ${cur} / ${tot}"
        ;;
    *)
        echo "⏹ 00:00 / 00:00"
        ;;
esac
