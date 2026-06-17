#!/usr/bin/env bash

# Exit on error
set -e

# enum logic for modes
if [[ -z "$1" ]]; then
  echo "Error: Mode is required. Use 'vscode', 'antigravity', or 'antigravity2'."
  exit 1
fi
MODE="$1"

# Get the directory of this script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define output destinations and exclusions based on mode
case "$MODE" in
  "vscode")
    KEYBINDINGS_OUTPUT="$HOME/dotfiles/vscode/.config/Code/User/keybindings.json"
    SETTINGS_OUTPUT="$HOME/dotfiles/vscode/.config/Code/User/settings.json"
    EXCLUDED_KEYBINDINGS=("60.antigravity.json" "61.antigravity_neovim.json")
    EXCLUDED_SETTINGS=()
    ;;
  "antigravity")
    KEYBINDINGS_OUTPUT="$HOME/dotfiles/antigravity/.config/Antigravity/User/keybindings.json"
    SETTINGS_OUTPUT="$HOME/dotfiles/antigravity/.config/Antigravity/User/settings.json"
    EXCLUDED_KEYBINDINGS=()
    EXCLUDED_SETTINGS=()
    ;;
  "antigravity2")
    KEYBINDINGS_OUTPUT="$HOME/dotfiles/antigravity2/.config/Antigravity IDE/User/keybindings.json"
    SETTINGS_OUTPUT="$HOME/dotfiles/antigravity2/.config/Antigravity IDE/User/settings.json"
    # antigravity v2 has built-in neovim support
    EXCLUDED_KEYBINDINGS=("50.neovim-extension.json" "61.antigravity_neovim.json")
    EXCLUDED_SETTINGS=("29.neovim.json")
    ;;
  *)
    echo "Error: Invalid mode \"$MODE\". Use 'vscode', 'antigravity', or 'antigravity2'."
    exit 1
    ;;
esac

echo "Building config for mode: $MODE"

# Ensure output directories exist
mkdir -p "$(dirname "$KEYBINDINGS_OUTPUT")"
mkdir -p "$(dirname "$SETTINGS_OUTPUT")"

# ----------------- Merging Keybindings -----------------
echo "Building $KEYBINDINGS_OUTPUT..."
echo "[" > "$KEYBINDINGS_OUTPUT"

first_keybinding=true

for file in "$SCRIPT_DIR"/_keybindings/*.json; do
  filename=$(basename "$file")
  
  # check if the current file is in the exclusion list
  skip=false
  for excl in "${EXCLUDED_KEYBINDINGS[@]}"; do
    if [[ "$filename" == "$excl" ]]; then
      skip=true
      break
    fi
  done
  if [[ "$skip" == true ]]; then
    echo "Skipping $file"
    continue
  fi
  
  echo "Processing $file"
  content=$(sed '1d;$d' "$file")

  if [[ "$first_keybinding" == true ]]; then
    echo "$content" >> "$KEYBINDINGS_OUTPUT"
    first_keybinding=false
  else
    echo "," >> "$KEYBINDINGS_OUTPUT"
    echo "$content" >> "$KEYBINDINGS_OUTPUT"
  fi
done

echo "]" >> "$KEYBINDINGS_OUTPUT"

# ----------------- Merging Settings -----------------
echo "Building $SETTINGS_OUTPUT..."
echo "{" > "$SETTINGS_OUTPUT"

first_setting=true

for file in "$SCRIPT_DIR"/_settings/*.json; do
  filename=$(basename "$file")

  # check if the current file is in the exclusion list
  skip=false
  for excl in "${EXCLUDED_SETTINGS[@]}"; do
    if [[ "$filename" == "$excl" ]]; then
      skip=true
      break
    fi
  done
  if [[ "$skip" == true ]]; then
    echo "Skipping $file"
    continue
  fi

  echo "Processing $file"
  content=$(sed '1d;$d' "$file")

  if [[ "$first_setting" == true ]]; then
    echo "$content" >> "$SETTINGS_OUTPUT"
    first_setting=false
  else
    echo "," >> "$SETTINGS_OUTPUT"
    echo "$content" >> "$SETTINGS_OUTPUT"
  fi
done

echo "}" >> "$SETTINGS_OUTPUT"

# ----------------- Formatting -----------------
echo "Formatting with prettier..."
if command -v prettier >/dev/null 2>&1; then
  prettier -w "$KEYBINDINGS_OUTPUT" "$SETTINGS_OUTPUT"
else
  echo "prettier not found, skipping formatting"
fi

echo "✅ Done"
