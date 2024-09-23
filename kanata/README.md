- download katana binary: https://github.com/jtroo/kanata/releases/tag/v1.6.1
- install kanata binary:
    - chmod +x kanata
    - sudo mv kanata /usr/bin/

- try linux specific tool in future: https://github.com/rvaiya/keyd

```bash
# reference: https://github.com/jtroo/kanata/discussions/130#discussioncomment-9970020
mkdir /etc/kanata

# test kanata changes on website, before applying them here, not-working of important keys like `Enter` will be hard to fix
# if suddenly, <Caps> become active instead of creating new config, better to just: stop kanata -> <Caps> -> start kanata
sudo cp ./config.kbd /etc/kanata/config.kbd
sudo install -m 644 kanata.service /lib/systemd/system/kanata.service
# sudo systemctl daemon-reload # maybe this will be required when changing the service file
sudo systemctl start kanata
sudo systemctl enable kanata

# restart (if you changed configuration)
sudo systemctl restart kanata.service

# check status
sudo systemctl status kanata.service
# if not working some-day, just execute last 2 commands above to restart kanata
```
