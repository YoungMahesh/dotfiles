path() {
  # echo "$PATH" outputs the entire PATH string
  # tr ':' '\n' translates (replaces) each colon : with a newline \n
  echo "$PATH" | tr ':' '\n' 
}
clean_path() {
    # Remove duplicates while preserving order
    export PATH=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':' | sed 's/:$//')
    echo "PATH cleaned and updated."
}

# set PATH so it includes user's private bin if it exists
export PATH="$HOME/.local/bin:$PATH"

