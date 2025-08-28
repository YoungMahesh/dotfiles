# To define the time you can provide concrete values for
# minute (m), hour (h), day of month (dom), month (mon),
# and day of week (dow) or use '*' in these fields (for 'any').
# 
# Output of the crontab jobs (including errors) is sent through
# email to the user the crontab file belongs to (unless redirected).
# 
# For example, you can run a backup of all your user accounts
# at 5 a.m every week with:
# 0 5 * * 1 tar -zcf /var/backups/home.tgz /home/
# m h  dom mon dow   command

# 0 means the job runs at the 0th minute (on the hour).
# 7-21/2 means every 2 hours starting from 7 AM to 9 PM (21 in 24-hour format).
# * * * means every day, every month, and every day of the week.
# sync-data is the command to be executed.
0 7-21/2 * * * bash ~/.config/sync/main.bash
