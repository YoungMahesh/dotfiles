alias tw=timew
alias tws='timew summary'
alias tk=task
alias tka='task all status:pending'
alias sync-data='bash ~/.config/sync/main.bash'
alias sync-logs='cat ~/.config/sync/logs'

alias copy='xclip -selection clipboard'

alias vpn11='wg-quick up primary'
alias vpn10='wg-quick down primary'
alias vpn21='wg-quick up secondary'
alias vpn20='wg-quick down secondary'
alias vpn31='wg-quick up development'
alias vpn30='wg-quick down development'

# neovim
alias vi='nvim'
alias vit='NVIM_APPNAME=nvim-typescript nvim'

# github cli
alias ghp='GH_CONFIG_DIR=$HOME/.config/gh-personal gh'
alias ghw='GH_CONFIG_DIR=$HOME/.config/gh-work gh'

# opencode
alias oc2='opencode attach http://localhost:4097'

alias agyd='agy --dangerously-skip-permissions'
