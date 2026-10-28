# in first setup use - `chmod +x <file-name>`
# Switch to workspace 4
i3-msg "workspace number 4"

# Count Chromium windows in workspace 4
# for chromium - .window_properties?.class? == "chromium"
# for chrome - .window_properties?.class? == "Google-chrome"
CHROMIUM_COUNT=$(i3-msg -t get_tree | jq '.nodes[] | .. | select(.type? == "workspace" and .name? == "4") | .. | select(.window_properties?.class? == "Google-chrome") | .window_properties.class' | wc -l)

# Only launch Chromium if no Chromium windows exist in the workspace
if [ "$CHROMIUM_COUNT" -eq 0 ]; then
    # workspace directory-names: 1st created - 'Default'
    # 2nd created: 'Profile 1'; 3rd created - 'Profile 2'
    # for chromium - chromium --new-window
    # for chrome - google-chrome --new-window

    google-chrome --new-window --profile-directory="Profile 4" --force-device-scale-factor=1.2
fi
