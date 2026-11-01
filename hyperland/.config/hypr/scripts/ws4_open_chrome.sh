#!/usr/bin/env bash

# Switch to workspace 4
hyprctl dispatch 'hl.dsp.focus({ workspace = "4" })'

# Check for Chrome windows on workspace 3
CHROME_COUNT=$(hyprctl -j clients | jq '
    [.[] | select(
        .workspace.name == "4" and
        (.class | ascii_downcase | test("google-chrome"))
    )] | length
')

# Launch Chrome only if no Chrome window exists
if [ "$CHROME_COUNT" -eq 0 ]; then
    google-chrome-stable --new-window --profile-directory="Profile 2"
fi
