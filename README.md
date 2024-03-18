```bash
sudo apt install stow  # install gnu-stow

# propagate config files on ubuntu using stow
git clone https://github.com/YoungMahesh/dotfiles  # download all config files
cd dotfiles
stow nvim  # create symlinks as defined in nvim-directory
stow .   # create symlinks for all directories/packages 
stow --adopt .  # copy configuration to dotfiles here, if any config file already exists, you can verify changes using git diff

# ignore files documentation: https://www.gnu.org/software/stow/manual/stow.html#Ignore-Lists
```
