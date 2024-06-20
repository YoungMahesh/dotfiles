```bash
nix-shell --version
# nix-shell (Nix) 2.23.0


# get installed nix-shell info
nix-shell -p nix-info --run "nix-info -m"

nix-shell -p cowsay lolcat # install packages(-p) 'cowsay' and 'lolcat' in nix-shell

nix-shell # go into nix-shell

# Ctrd+d  # exit nix-shell

nix-shell -p cowsay --run 'cowsay nix'  # run nix-shell program in bash

nix-collect-garbage # free up disk space
```
