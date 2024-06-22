# -d starts a new session in detached mode
# -s specifies the session name
# -n specifies the window name
# C-m is the Enter key
# -t specifies the target pane
# -h splits the window horizontally

# ncf-vim
tmux new-session -d -s nc -n 'ncf-vim'
tmux send-keys -t nc:ncf-vim 'cd ~/company/nft-clash/apps/frontend' C-m

tmux new-window -t nc:1 -n ncc
tmux send-keys -t nc:ncc 'cd ~/company/nft-clash/contracts' C-m

tmux new-window -t nc:2 -n localhost
tmux send-keys -t nc:localhost 'cd ~/company/nft-clash/apps/frontend' C-m
tmux split-window -h -t nc:localhost
tmux send-keys -t nc:localhost.1 'cd ~/company/nft-clash/contracts' C-m
#tmux send-keys -t nc:localhost.1 'bash start.localnet.bash' C-m

tmux new-window -t nc:3 -n note
tmux send-keys -t nc:note 'notes ls' C-m

tmux new-window -t nc:4 -n server

tmux new-window -t nc:5 -n dotfiles
tmux send-keys -t nc:dotfiles 'cd ~/dotfiles' C-m

tmux select-window -t nc:ncf-vim
tmux attach-session -t nc

