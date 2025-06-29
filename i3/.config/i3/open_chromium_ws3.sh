# in first setup use - `chmod +x <file-name>`
# switch/open workspace 3
i3-msg "workspace number 3"
# `workspace number 9` and `chromium` run asynchronously, so your chromium script may execute before the workspace 
# switch finishes which will lead to no opening of chromium in workspace 9, hence use sleep to add tiny delay
#sleep 0.1

# Try to focus existing Chromium window in workspace 9
if ! i3-msg '[class="Chromium" workspace="3"] focus' 2>/dev/null; then
    chromium --new-window --profile-directory="Default" 
fi
