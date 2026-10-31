#!/usr/bin/env bash

# Switch to workspace 2
hyprctl dispatch 'hl.dsp.focus({ workspace = "2" })'

sleep 0.5

# Count Chrome windows on workspace 2
CHROME_COUNT=$(hyprctl -j clients | jq '
    [.[] | select(
        .workspace.name == "2" and
        (.class | ascii_downcase | test("google-chrome"))
    )] | length
')

# Launch Chrome only if no Chrome window exists on workspace 2
if [ "$CHROME_COUNT" -eq 0 ]; then
    google-chrome-stable --new-window \
        --profile-directory="Profile 1" \
        --force-device-scale-factor=1.2
fi
