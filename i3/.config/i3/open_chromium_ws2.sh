# in first setup use - `chmod +x <file-name>`
# Switch to workspace 2
i3-msg "workspace number 2"

# Count Chromium windows in workspace 2
CHROMIUM_COUNT=$(i3-msg -t get_tree | jq '.nodes[] | .. | select(.type? == "workspace" and .name? == "2") | .. | select(.window_properties?.class? == "Chromium") | .window_properties.class' | wc -l)

# Only launch Chromium if no Chromium windows exist in workspace 2
if [ "$CHROMIUM_COUNT" -eq 0 ]; then
    # workspace directory-names: 1st created - 'Default' 
    # 2nd created: 'Profile 1'; 3rd created - 'Profile 2'
    chromium --new-window --profile-directory="Profile 1"
fi

