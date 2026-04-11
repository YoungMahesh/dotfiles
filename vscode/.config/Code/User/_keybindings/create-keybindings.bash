# jq -s 'add' $(ls *.json | grep -v keybindings.json) > keybindings.json

# exist on error
set -e

# enum logic for modes
if [[ -z "$1" ]]; then
  echo "Error: Mode is required. Use 'vscode' or 'antigravity'."
  exit 1
fi
MODE="$1"
# define exclusion lists based on mode
case "$MODE" in
  "vscode")
    OUTPUT="$HOME/dotfiles/vscode/.config/Code/User/keybindings.json"
    EXCLUDED=("$OUTPUT" "60.antigravity.json")
    ;;
  "antigravity")
    OUTPUT="$HOME/dotfiles/antigravity/.config/Antigravity/User/keybindings.json"
    EXCLUDED=("$OUTPUT")
    ;;
  *)
    echo "Error: Invalid mode \"$MODE\". Use 'vscode' or 'antigravity'."
    exit 1
    ;;
esac

echo "Building $OUTPUT for mode: $MODE"
echo "[" > "$OUTPUT"

first=true

for file in *.json; do
  
  # check if the current file is in the exclusion list
  skip=false
  for excl in "${EXCLUDED[@]}"; do
    if [[ "$file" == "$excl" ]]; then
      skip=true
      break
    fi
  done
  if [[ "$skip" == true ]]; then
    echo "Skipping $file"
    continue
  fi
  
  echo "Processing $file"

  # remove first and last line ([ and ])
  content=$(sed '1d;$d' "$file")

  if [[ "$first" == true ]]; then
    echo "$content" >> "$OUTPUT"
    first=false
  else
    echo "," >> "$OUTPUT"
    echo "$content" >> "$OUTPUT"
  fi
done

echo "]" >> "$OUTPUT"
echo "Merged JSON"

echo "Formatting with prettier"
prettier -w "$OUTPUT"
echo "✅ Done"
