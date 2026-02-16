# ---------------------- package installations ------------------------------

# if you have installed vlc through flathub
#alias vlc='flatpak run org.videolan.VLC'



# folder color to orange, only for default terminal [no need in alacritty or kitty]
#export LS_COLORS="$LS_COLORS:di=38;5;208"

# for ansible
#export LC_ALL="en_US.UTF-8"
#export LANG="en_US.UTF-8"

#alias pn='pnpm'

# stripe: cli through docker, --network host tells cli to look network on host computer instead of inside docker-container
#alias stripe='docker run --rm -it --network host stripe/stripe-cli:latest'

export EDITOR=nvim


alias python=python3


alias tw=timew
alias tws='timew summary'
alias tk=task
alias tka='task all status:pending'
alias sync-data='bash ~/.config/sync/main.bash'
alias sync-logs='cat ~/.config/sync/logs'
alias rclone1='rclone rcd --rc-web-gui'

