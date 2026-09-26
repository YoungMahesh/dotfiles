wrkspace="10"

# switch/open workspace
i3-msg "workspace number $wrkspace"

# count of windows currently opened in workspace
WINDOW_COUNT=$(i3-msg -t get_tree |
  jq --arg workspace "$wrkspace" '
    [
      .. |
      select(.type? == "workspace" and .name? == $workspace) |
      recurse(.nodes[]?, .floating_nodes[]?) |
      select(.window_properties?.class?)
    ] | length
  ')

# if window count is zero
if [ "$WINDOW_COUNT" -eq 0 ]; then
    # open antigravity
    /usr/bin/antigravity
fi
