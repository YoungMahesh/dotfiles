#!/usr/bin/env bash

# Switch to workspace 8
hyprctl dispatch 'hl.dsp.focus({ workspace = "8" })'

# Check for Chrome windows on workspace 8
CHROME_COUNT=$(hyprctl -j clients | jq '
    [.[] | select(
        .workspace.name == "8" and
        (.class | ascii_downcase | test("google-chrome"))
    )] | length
')

# Launch Chrome only if no Chrome window exists
if [ "$CHROME_COUNT" -eq 0 ]; then
    google-chrome-stable --new-window --profile-directory="Default" "https://chatgpt.com"
fi
