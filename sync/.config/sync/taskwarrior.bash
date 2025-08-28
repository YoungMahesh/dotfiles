task_backup="task_$(date +%Y-%m-%d_%H-%M-%S).zip"

zip -r ~/"$task_backup" ~/.task > /dev/null

echo "Backup created: $task_backup"

rclone move ~/"$task_backup" pcloud-backup:taskwarrior

echo "Backup: $task_backup, uploaded to cloud"
echo "----------------------------------------"
