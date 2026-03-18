#!/bin/sh

# Switch to workspace 8
i3-msg "workspace number 8"

# verify working of logic: i3-msg -t get_tree | grep -qi '"class":"obsidian"' && echo true || echo false
# grep -i = case-insensitive ; -q = quiet-mode, do not print anything
if ! i3-msg -t get_tree | grep -qi '"class":"obsidian"'; then

  # Open first vault (foreground)
  # with & at the end of command: i) both commands run in background ii) shell does NOT wait iii) both vaults launch independently
  /snap/bin/obsidian "obsidian://open?vault=documentation" &

  # Wait for Obsidian to initialize, sending multiple requests simultaneously will lead to few of them will get rejected
  sleep 2

  # Open second vault
  /snap/bin/obsidian "obsidian://open?vault=principles" &
fi



# NOTE: in first setup use - `chmod +x <file-name>`
