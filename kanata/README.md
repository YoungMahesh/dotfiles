download katana binary: https://github.com/jtroo/kanata/releases/tag/v1.6.1

- try linux specific tool in future: https://github.com/rvaiya/keyd

```bash
# reference: https://github.com/jtroo/kanata/discussions/130#discussioncomment-9970020
mkdir /etc/kanata
cp my-config-for-kanata.kbd /etc/kanata/kanata.kbd
sudo install -m 644 kanata.service /lib/systemd/system/kanata.service
# sudo systemctl daemon-reload # maybe this will be required when changing the service file
sudo systemctl start kanata
sudo systemctl enable kanata

# if not working some-day, just execute last 2 commands above to restart kanata
```
