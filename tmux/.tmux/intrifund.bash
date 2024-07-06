# -d starts a new session in detached mode
# -s specifies the session name
# -n specifies the window name
# C-m is the Enter key
# -t specifies the target pane
# -h splits the window horizontally

tmux new-session -d -s nc -n 'intrifund'

tmux send-keys -t nc:intrifund 'cd ~/company/intrifund/intrifund' C-m

tmux new-window -t nc:1 -n contracts
tmux send-keys -t nc:contracts 'cd ~/company/intrifund/contracts' C-m

tmux new-window -t nc:2 -n localhost
tmux send-keys -t nc:localhost 'cd ~/company/intrifund/intrifund' C-m
tmux split-window -h -t nc:localhost
tmux send-keys -t nc:localhost.1 'cd ~/company/intrifund/contracts' C-m
#tmux send-keys -t nc:localhost.1 'bash start.localnet.bash' C-m

tmux new-window -t nc:3 -n note
tmux send-keys -t nc:note 'notes ls' C-m

tmux new-window -t nc:4 -n server

tmux new-window -t nc:5 -n dotfiles
tmux send-keys -t nc:dotfiles 'cd ~/dotfiles' C-m

tmux select-window -t nc:intrifund # after tmux attach-session, connect to this window
tmux attach-session -t nc

