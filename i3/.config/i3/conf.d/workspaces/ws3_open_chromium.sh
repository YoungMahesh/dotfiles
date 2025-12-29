# in first setup use - `chmod +x <file-name>`
# Switch to workspace 3  
# why 'google-chrome' instead of 'chromimum'?
#   - can auto-sync browser-bookmarks with google-account with google-chrome but not with chromium
i3-msg "workspace number 3"

# Count Chromium windows in workspace 3
#
# for chromium - .window_properties?.class? == "chromium"
# for chrome - .window_properties?.class? == "Google-chrome"
CHROMIUM_COUNT=$(i3-msg -t get_tree | jq '.nodes[] | .. | select(.type? == "workspace" and .name? == "3") | .. | select(.window_properties?.class? == "Google-chrome") | .window_properties.class' | wc -l)

# Only launch Chromium if no Chromium windows exist in workspace 3
if [ "$CHROMIUM_COUNT" -eq 0 ]; then
    # workspace directory-names: 1st created - 'Default' 
    # 2nd created: 'Profile 1'; 3rd created - 'Profile 2'
    # for chromium - chromium --new-window
    # for chrome - google-chrome --new-window
    google-chrome --new-window --profile-directory="Default"
fi

