# install on ubuntu: sudo apt install fish
# docs: https://fishshell.com/

# set fish as default terminal
# 1. get path-of-fish: which fish 
# 2. check if fish is part of acceptable shells: cat /etc/shells
# if not, then add it to list of acceptable shells: echo <path-of-fish> | sudo tee -a /etc/shells
# 3. change default shell defualt shell: chsh -s <path-of-fish> 
# 4. logout and login again
# 5. open terminal and verify default shell: echo $SHELL

# switch temporarily to bash
# 1. bash
# 2. echo $0   # if output is "bash", then you are in bash terminal

set -g fish_color_command white # default is dark-blue which is unreadable

# accept suggestions with tab, default is: Ctrl+f
bind \t accept-autosuggestion

# neovim
# neovim lsp does not work with fish, switch to using `bash` and then use nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

starship init fish | source

# messages when we open terminal
set -U fish_greeting "rejecting failure == rejecting success"



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


