backup_file="timew_$(date +%Y-%m-%d_%H-%M-%S).zip"

zip -r ~/"$backup_file" ~/.task > /dev/null

echo "Backup created: $backup_file"

rclone move ~/"$backup_file" pcloud-backup:timewarrior

echo "Backup: $backup_file, uploaded to cloud"
echo "----------------------------------------"
