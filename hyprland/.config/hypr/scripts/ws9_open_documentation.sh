#!/usr/bin/env bash

# Switch to workspace 9
hyprctl dispatch 'hl.dsp.focus({ workspace = "9" })'

# Count open windows on workspace 9
WINDOW_COUNT=$(hyprctl -j clients | jq '
    [.[] | select(.workspace.name == "9")] | length
')

ZED_CMD="zeditor"
# If workspace is empty, open notes directories in Zed
if [ "$WINDOW_COUNT" -eq 0 ]; then
    "$ZED_CMD" "$HOME/sync/notes/documentation"
    "$ZED_CMD" "$HOME/sync/notes/principles"
fi
