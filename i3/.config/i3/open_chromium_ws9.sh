#!/bin/bash
# Try to focus existing Chromium window in workspace 9
if ! i3-msg '[class="Chromium" workspace="9"] focus' 2>/dev/null; then
    # If no Chromium found in workspace 9, launch it
    chromium --new-window --profile-directory="Default" "https://t3.chat"
    #echo "Chromium launched" >> ~/m
else
    #echo "Found and focused existing Chromium" >> ~/m
fi
