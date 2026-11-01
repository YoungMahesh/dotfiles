#!/usr/bin/env bash

# Switch to workspace 1
hyprctl dispatch 'hl.dsp.focus({ workspace = "1" })'

# Launch kitty only if it isn't already running (i3: pgrep kitty || $term)
if ! pgrep -x kitty >/dev/null; then
    kitty --session "$HOME/.config/kitty/sessions.conf"
fi
