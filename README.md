### initialize
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


### bash
- `.bashrc` files comes with some default configuration, to keep default configuration intact, all the custom .bashrc configuration is added to `.bashrc-extra` file
- append line `source ~/.bashrc-extra` to `~/.bashrc` file to import custom changes
    - create `.bashrc-extra` file with `stow bash` from present-working-directory
