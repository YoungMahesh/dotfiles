# in first setup use - `chmod +x <file-name>`
# Switch to workspace 8
i3-msg "workspace number 8"

# bug: if multiple profiles of chromium opened in workspace; switching out and back to workspace 9 always leads to focus on non 'Default'
#   profile; but as we does not open multiple-profiles here, this does not matter
if ! i3-msg '[class="Chromium" workspace="8"] focus' 2>/dev/null; then
    # workspace directory-names: 1st created - 'Default'; 2nd created: 'Profile 1'; 3rd created - 'Profile 2'
    chromium --new-window --profile-directory="Default" "https://app.clockify.me/tracker"

fi

