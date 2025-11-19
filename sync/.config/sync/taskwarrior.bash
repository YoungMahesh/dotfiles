BACKUP_FILE_PATH="$HOME/task_$(date +%Y-%m-%d_%H-%M-%S).zip"
SOURCE_PATH="$HOME/.task"
REMOTE_PATH="pcloud-backup:taskwarrior"

zip -r "$BACKUP_FILE_PATH" "$SOURCE_PATH" > /dev/null

echo "Backup created: $BACKUP_FILE_PATH"

rclone move "$BACKUP_FILE_PATH" "$REMOTE_PATH"

echo "Backup: $BACKUP_FILE_PATH, uploaded to cloud"
echo "----------------------------------------"

# delete files older than 60 days
rclone delete "$REMOTE_PATH" --min-age 60d -v

