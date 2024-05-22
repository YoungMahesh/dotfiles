# install on ubuntu: sudo apt install fish
# docs: https://fishshell.com/

set -g fish_color_command white # default is dark-blue which is unreadable

# accept suggestions with tab, default is: Ctrl+f
bind \t accept-autosuggestion

# neovim
export PATH="$PATH:/opt/nvim-linux64/bin"

starship init fish | source


zoxide init fish | source

#set -g fish_color_keyword white
#set -g fish_color_quote yellow
#set -g fish_color_redirection white
#set -g fish_color_end white
#set -g fish_color_error red
#set -g fish_color_param white
#set -g fish_color_comment cyan
#set -g fish_color_selection white
#set -g fish_color_search_match white
#set -g fish_color_operator white
#set -g fish_color_escape white
#set -g fish_color_autosuggestion white
#set -g fish_color_cancel white
#set -g fish_color_cwd white
#set -g fish_color_user white
#set -g fish_color_host white
#set -g fish_color_match white
#set -g fish_color_selection white
#set -g fish_color_search_match white
#set -g fish_color_operator white


# install fisher: https://github.com/jorgebucaran/fisher
# install theme (https://github.com/catppuccin/fish)
# fisher install catppuccin/fish
#fish_config theme save "Catppuccin Mocha"


