# in first setup use - `chmod +x <file-name>`

wrkspace="9"

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

    # open dotfiles in zed
    /home/mahesh/.local/bin/zed /home/mahesh/dotfiles

    # Wait for zed-editor to initialize, sending multiple requests simultaneously is not good
    sleep 1

    # open notes-documentation
    /home/mahesh/.local/bin/zed /home/mahesh/sync/notes/documentation
fi
