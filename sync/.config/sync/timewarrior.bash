BACKUP_FILE_PATH="$HOME/timew_$(date +%Y-%m-%d_%H-%M-%S).zip"
SOURCE_PATH="$HOME/.local/share/timewarrior/data"
REMOTE_PATH="pcloud-backup:timewarrior"

zip -r "$BACKUP_FILE_PATH" "$SOURCE_PATH" > /dev/null

echo "Backup created at: $BACKUP_FILE_PATH"

rclone move "$BACKUP_FILE_PATH" "$REMOTE_PATH" 

echo "Backup: $BACKUP_FILE_PATH, moved to cloud"
echo "----------------------------------------"

# delete files older than 60 days
rclone delete "$REMOTE_PATH" --min-age 60d -v

