LOG_FILE="$HOME/.config/sync/logs"
bash ~/.config/sync/taskwarrior.bash >> "$LOG_FILE" 
bash ~/.config/sync/timewarrior.bash >> "$LOG_FILE"
bash ~/.config/sync/truncate-file.bash "$LOG_FILE" 
