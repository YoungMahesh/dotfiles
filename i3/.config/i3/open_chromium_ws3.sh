# in first setup use - `chmod +x <file-name>`
# Switch to workspace 3  
i3-msg "workspace number 3"

# Count Chromium windows in workspace 3
CHROMIUM_COUNT=$(i3-msg -t get_tree | jq '.nodes[] | .. | select(.type? == "workspace" and .name? == "3") | .. | select(.window_properties?.class? == "Chromium") | .window_properties.class' | wc -l)

# Only launch Chromium if no Chromium windows exist in workspace 3
if [ "$CHROMIUM_COUNT" -eq 0 ]; then
    # workspace directory-names: 1st created - 'Default' 
    # 2nd created: 'Profile 1'; 3rd created - 'Profile 2'
    chromium --new-window --profile-directory="Default"
fi

