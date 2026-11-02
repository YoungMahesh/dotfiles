```sh
# 1. Symlink into /etc/udev/hwdb.d/
# as we are applying changes to /etc instead of ~/etc, we need to specify target with `-t /`
sudo stow -t / systemd

# 2. Compile the database and reload udev
sudo systemd-hwdb update
sudo udevadm trigger --subsystem-match=input --action=change
```
