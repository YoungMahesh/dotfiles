path() {
  # echo "$PATH" outputs the entire PATH string
  # tr ':' '\n' translates (replaces) each colon : with a newline \n
  echo "$PATH" | tr ':' '\n' | fzf
}
clean_path() {
    # Remove duplicates while preserving order
    export PATH=$(echo "$PATH" | tr ':' '\n' | awk '!seen[$0]++' | tr '\n' ':' | sed 's/:$//')
    echo "PATH cleaned and updated."
}

# set PATH so it includes user's private bin if it exists
#PATH="$HOME/bin:$PATH"
# set PATH so it includes user's private bin if it exists
#PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

export PATH="$PATH:/home/mahesh/.bun/bin"

# for python-poetry
export PATH="/home/mahesh/.local/bin:$PATH"
