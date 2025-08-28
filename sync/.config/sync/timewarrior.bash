backup_file="timew_$(date +%Y-%m-%d_%H-%M-%S).zip"

zip -r ~/"$backup_file" ~/.local/share/timewarrior/data > /dev/null

echo "Backup created: $backup_file"

rclone move ~/"$backup_file" pcloud-backup:timewarrior

echo "Backup: $backup_file, uploaded to cloud"
echo "----------------------------------------"
