```bash
# rebuild and switch to apply new configuration
sudo nixos-rebuild switch
```
### Changes done
- updated `environment.systemPackages = [];` at `/etc/nixos/configuration.nix`
- added line for flakes support
- copied files from `/etc/nixos` in current directory to track changes
