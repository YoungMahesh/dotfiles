# in first setup use - `chmod +x <file-name>`
# switch/open workspace 4
i3-msg "workspace number 4"
# `workspace number 4` and `chromium` run asynchronously, so your chromium script may execute before the workspace
# switch finishes which will lead to no opening of chromium in workspace 4, hence use sleep to add tiny delay
#sleep 0.1

# Try to focus existing Chromium window in workspace 4
# bug: if multiple profiles of chromium opened in workspace; switching out and back to workspace 4 always leads to focus on non 'Default'
#   profile; but as we does not open multiple-profiles here, this does not matter
if ! i3-msg '[class="Google-chrome" workspace="4"] focus' 2>/dev/null; then
    google-chrome --new-window --profile-directory="Default" "https://chatgpt.com"
fi
