- Files here will autostart application by executing `Exec` command on every reboot; To add new application,
  click 'Add' in 'Startup Applications' in gnome-search

- For chrome webapps define weburl (`-app`) and profile (`--profile-directory`) as follow:
  `/usr/bin/google-chrome --app="https://mail.google.com" --profile-directory="Profile 1"`
  - to get profile directory visit `chrome://version` in chrome and check value of `Profile Path` variable

- For apps no longer in use, i put `.suspended` extension
