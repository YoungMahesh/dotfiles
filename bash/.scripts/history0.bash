# Set maximum number of commands in memory during a session
HISTSIZE=500

# Set maximum number of commands to save in the history file
HISTFILESIZE=0

# Optional: Ignore duplicate commands and commands starting with space
HISTCONTROL=ignoreboth

# Bind Ctrl+R to fzf history search
__fzf_history__() {
    # 1. Pass through fuzzy finder (fzf) `| fzf --tac --no-sort --exact +m -e`
    #   | pipes the history output to fzf
    #   --tac: Reverses the order (most recent commands first)
    #   --no-sort: Keeps the original order of commands
    #   --exact: Requires exact match when searching
    #   +m: Allow only single selection
    #   -e: Enable exact matching mode
    # 2. Remove line numbers `| awk '{$1=""; print $0}'`
    #   Removes the first field (history line number)
    #   $1="" sets the first field to empty
    #   print $0 prints the entire line (now without the line number)
    # 3. Remove leading whitespace `| sed 's/^ *//'`
    #   Removes leading whitespace from the beginning of the line
    #   s/^ *// is a sed substitution that replaces leading spaces with nothing
    #   Ensures the command starts exactly at the first character
    local selected=$(history | fzf --tac --no-sort --exact +m -e | awk '{$1=""; print $0}' | sed 's/^ *//')
    
    if [ -n "$selected" ]; then
        READLINE_LINE="$selected"
        READLINE_POINT=${#READLINE_LINE}
    fi
}

# Bind the function to Ctrl+R
bind -x '"\C-r": __fzf_history__'

