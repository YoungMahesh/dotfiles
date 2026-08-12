#!/bin/sh

# Switch to workspace 8
i3-msg "workspace number 8"

# Count Obsidian windows on any workspace.
# Recent Obsidian releases (verified on 1.13.6) set:
#   window_properties.class    = "md.obsidian.Obsidian"
#   window_properties.instance = "md.obsidian.obsidian"
# Run left-to-right: `i3-msg` → `jq` → `grep`, with each stage consuming the previous stage's output.
# `i3-msg` talks to the running i3 window manager over its IPC socket and returns a structured response.
#   The `-t get_tree` flag asks for the **tree representation** — a recursive JSON description of every container, workspace, and window i3 currently manages
# The `// empty` alternative then converts any `null` / missing / error result into the empty string,
#   so jq's `-r` (raw output) flag emits a clean newline per surviving class.
# grep -ic;
#   `-i` - case-insensitive
#   `-c` - instead of printing matching lines, print **the count of matching lines** only.
OBSIDIAN_COUNT=$(i3-msg -t get_tree \
  | jq -r '.. | .window_properties? | .class? // empty' \
  | grep -ic 'md\.obsidian\.obsidian')

if [ "$OBSIDIAN_COUNT" -eq 0 ]; then

  # Open first vault (foreground)
  # with & at the end of command: i) both commands run in background ii) shell does NOT wait iii) both vaults launch independently
  /snap/bin/obsidian "obsidian://open?vault=documentation" &

  # Wait for Obsidian to initialize, sending multiple requests simultaneously will lead to few of them will get rejected
  sleep 2

  # Open second vault
  /snap/bin/obsidian "obsidian://open?vault=principles" &
fi



# NOTE: in first setup use - `chmod +x <file-name>`
