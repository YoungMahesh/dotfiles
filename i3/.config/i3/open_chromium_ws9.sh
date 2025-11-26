# in first setup use - `chmod +x <file-name>`
# switch/open workspace 9
i3-msg "workspace number 9"
# `workspace number 9` and `chromium` run asynchronously, so your chromium script may execute before the workspace 
# switch finishes which will lead to no opening of chromium in workspace 9, hence use sleep to add tiny delay
#sleep 0.1

# Try to focus existing Chromium window in workspace 9
# bug: if multiple profiles of chromium opened in workspace; switching out and back to workspace 9 always leads to focus on non 'Default'
#   profile; but as we does not open multiple-profiles here, this does not matter
if ! i3-msg '[class="Chromium" workspace="9"] focus' 2>/dev/null; then
    #chromium --new-window --profile-directory="Default" "https://t3.chat"
    chromium --new-window --profile-directory="Default" "https://chatgpt.com"
fi
