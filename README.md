```bash
# ------------ add a new file in dotfiles --------------
# 1. create empty file in specific directory
mkdir -p omarchy/.config/omarchy/
touch omarchy/.config/omarchy/shell.json
stow --adopt omarchy
# adopt will do this:
# 1. move `.config/omarchy/shell.json` to `dotfiles/omarchy/.config/omarchy/shell.json`
# 2. link `.config/omarchy/shell.json` to `../../dotfiles/omarchy/.config/omarchy/shell.json`
# dry-run stow adopt: stow -nv --adopt omarchy

# ------------ use existing dotfiles ----------------------
stow <directory>

# ------------ delete symlink related to dotfiles -------------
stow -D --target=~/Documents/My_First_Vault/ obsidian_master_config
```


### links
- #notes-site == https://www.remnote.com/profile/youngmahesh -> notes

### installation steps
- ssh-setup -> download dotfiles -> kanata -> neovim -> github-repositories -> bash -> fonts -> kitty -> 

### initialize
```bash
sudo apt install stow  # install gnu-stow

# propagate config files on ubuntu using stow
git clone https://github.com/YoungMahesh/dotfiles  # download all config files
cd dotfiles
stow package-name  # create symlinks as defined directory - package-name 
stow -D package-name # remove symlinks defined in directory - package-name
```


### bash
- `.bashrc` files comes with some default configuration, to keep default configuration intact, all the custom .bashrc configuration is added to `.bashrc-extra` file
- append line `source ~/.bashrc-extra` to `~/.bashrc` file to import custom changes
    - create `.bashrc-extra` file with `stow bash` from present-working-directory
