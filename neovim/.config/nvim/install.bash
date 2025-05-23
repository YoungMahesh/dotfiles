# TIP: do not move to new version until it becomes 3 month old, as plugins may not be compatible with new version
# for `nvim --version`: 0.9.5 -> 0.10.1 (on 26-august-2024)

# remove previous installation cache (taken from lazyvim installation script):
mv ~/.local/share/nvim{,.bak} # location of plugins actual-code
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

# modify code below into full-bash script during next installation, e.g. use curl to auto-download neovim binary
# 1. download Tarball by visiting page: https://github.com/neovim/neovim/releases/tag/v0.10.1
# 2. installation script for downloaded Tarball: https://github.com/neovim/neovim/blob/master/INSTALL.md#linux
# 3. install requirements [default commands are for ubuntu]:
#    1) c-compiler [ `sudo apt install build-essential`] for treesitter, harpoon, telescope, mason 
#       on nixos install `gcc` package
#
#    2) npm for tsserver 
#      on ubuntu install nodejs,npm through nvm: https://nodejs.org/en/download/package-manager
#    `sudo apt-get install ripgrep` (https://github.com/BurntSushi/ripgrep) for telescope
#    eslint_d :Mason -> eslint_d -> i
#    sudo apt install luarocks
#    for more     :checkhealth -> /error\c 
#
#    3) disabled: image.lua 
#      sudo apt install libmagickwand-dev
#      mermaid-support (NOT in use, as it is not working properly, more details in image.lua)
#        npm install -g @mermaid-js/mermaid-cli
#        fix sandbox error: 
#           edit .local/share/nvim/lazy/diagram.nvim/lua/diagram/renderers/mermaid.lua
#           add puppeteer config location to command_parts as:
#           local command_parts = { "mmdc", "-p", "~/.config/nvim/lua/mahesh/plugins/puppeteer-config.json", "-i", tmpsource, ...}
#
# nvim --version
# :checkhealth (will show if neovim detected config file)
# append `export XDG_CONFIG_HOME=/root/.config` to .bashrc file, if config is located at: /root/.config/nvim/init.lua
#    verify path using `echo $XDG_CONFIG_HOME`
#    neovim will look for $XDG_CONFIG_HOME=/nvim/init.lua
#    :help config, default path: ~/.config/nvim/init.lua
