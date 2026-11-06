```sh
# 1. Symlink into /etc/udev/hwdb.d/
# as we are applying changes to /etc instead of ~/etc, we need to specify target with `-t /`
sudo stow -t / systemd

# 2. start and enable keyboard-remapping service
sudo systemctl daemon-reload
# start service and test if it is working properly
sudo systemctl start keyboard-remapping.service
# auto-start service on every boot
sudo systemctl enable keyboard-remapping.service
# stop service auto-start on every boot
sudo systemctl disable keyboard-remapping.service
# check status of service
systemctl status keyboard-remapping.service
# view logs
journalctl -u keyboard-remapping.service -b
```
