- files here will autostart application by executing `Exec` command on every reboot
- to add new application, click 'Add' in 'Startup Applications' in gnome-search

- for chrome webapps define weburl (`-app`) and profile (`--profile-directory`) as follow:
  `/usr/bin/google-chrome --app="https://mail.google.com" --profile-directory="Profile 1"`
  - to get profile directory visit `chrome://version` in chrome and check value of `Profile Path` variable
