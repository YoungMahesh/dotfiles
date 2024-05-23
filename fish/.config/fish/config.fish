# install on ubuntu: sudo apt install fish
# docs: https://fishshell.com/
# NOTE: if some command is working in bash but not in fish, then quickly switch to bash by executing `bash` inside fish terminal window
# 	commands which shown problems with fish: nvim, npm
# 	output of `echo $0` in bash is "bash"

# set fish as default terminal
# 1. get path-of-fish: which fish 
# 2. check if fish is part of acceptable shells: cat /etc/shells
# if not, then add it to list of acceptable shells: echo <path-of-fish> | sudo tee -a /etc/shells
# 3. change default shell defualt shell: chsh -s <path-of-fish> 
# 4. logout and login again
# 5. open terminal and verify default shell: echo $SHELL

set -g fish_color_command white # default is dark-blue which is unreadable

# accept suggestions with tab, default is: Ctrl+f
bind \t accept-autosuggestion

# neovim
# neovim lsp does not work with fish, switch to using `bash` and then use nvim
export EDITOR=nvim
export PATH="$PATH:/opt/nvim-linux64/bin"

# alacrity command path
export PATH="$PATH:/home/mahesh/.cargo/bin"

starship init fish | source

# messages when we open terminal
set -U fish_greeting "rejecting failure == rejecting success"


# git shortcuts
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias ga='git add .'
alias gl='git log'
alias gc='git commit -m'
alias gp='git push'


# install fisher: https://github.com/jorgebucaran/fisher
# install theme (https://github.com/catppuccin/fish)
# fisher install catppuccin/fish
#fish_config theme save "Catppuccin Mocha"


