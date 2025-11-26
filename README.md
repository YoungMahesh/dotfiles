```bash
# create symlink where targets are multiple 
stow --target=~/Documents/My_First_Vault/ obsidian_master_config
stow --target=~/Documents/My_Second_Vault/ obsidian_master_config

# delete symlink
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

# adopt
# create folder structure and copy files from desired folder newly created folder
# remember that `--adopt` will not copy files if they are not alredy existed, it only creates symlinks
stow --adopt package-name  # copy configuration to dotfiles here, if any config file already exists, you can verify changes using git diff

# ignore files documentation: https://www.gnu.org/software/stow/manual/stow.html#Ignore-Lists
```


### bash
- `.bashrc` files comes with some default configuration, to keep default configuration intact, all the custom .bashrc configuration is added to `.bashrc-extra` file
- append line `source ~/.bashrc-extra` to `~/.bashrc` file to import custom changes
    - create `.bashrc-extra` file with `stow bash` from present-working-directory
