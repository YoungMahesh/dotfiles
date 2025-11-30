# TIP: do not move to new version until it becomes 3 month old, as plugins may not be compatible with new version
# setup for v0.11.5 (nvim --version)

set -ex  # Exit script if any command fails

echo "removing previous installatin cache..."
# taken from lazyvim installation script
mv ~/.local/share/nvim{,.bak} # location of plugins actual-code
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

echo "Downloading Neovim..."
DOWNLOAD_DIR="/tmp/nvim_download"
mkdir -p "$DOWNLOAD_DIR"
cd "$DOWNLOAD_DIR"
wget -q --show-progress https://github.com/neovim/neovim/releases/download/v0.11.5/nvim-linux-x86_64.tar.gz -O nvim.tar.gz

echo "Installing..."
echo "Install: Extracting..."
tar -xzf nvim.tar.gz
# Remove any existing installation
INSTALL_DIR="$HOME/.local/neovim"
sudo rm -rf "$INSTALL_DIR"
# after extraction we get folder named 'nvim-linux-x86_64'
sudo mv nvim-linux-x86_64 "$INSTALL_DIR"

echo "Install: Linking binary..."
# create 'nvim' and 'vi' commands
ln -s "$INSTALL_DIR/bin/nvim" "$HOME/.local/bin/nvim"
ln -s "$INSTALL_DIR/bin/nvim" "$HOME/.local/bin/vi"

echo "Done ✔"
nvim --version

echo "Installing dependencies..."

echo "1. install c-compiler for treesitter, harpoon, telescope, mason"
# on nixos install `gcc` package
sudo apt install build-essential

echo "2. dependencies for telescope"
sudo apt install ripgrep fd-find

echo "3. install luarocks"
sudo apt install luarocks

echo "install eslint inside neovim with - :Mason -> eslint_d -> i"
echo "install npm for working of tsserver"
echo "npm i tree-sitter-cli -g for nvim-treesitter"
echo "check errors with -  :checkhealth -> /error\c"
# ----------------------- local ----------------------
#
#    4) disabled: image.lua 
#      sudo apt install libmagickwand-dev
#      mermaid-support (NOT in use, as it is not working properly, more details in image.lua)
#        npm install -g @mermaid-js/mermaid-cli
#        fix sandbox error: 
#           edit .local/share/nvim/lazy/diagram.nvim/lua/diagram/renderers/mermaid.lua
#           add puppeteer config location to command_parts as:
#           local command_parts = { "mmdc", "-p", "~/.config/nvim/lua/mahesh/plugins/puppeteer-config.json", "-i", tmpsource, ...}
#
# nvim --version
# append `export XDG_CONFIG_HOME=/root/.config` to .bashrc file, if config is located at: /root/.config/nvim/init.lua
#    verify path using `echo $XDG_CONFIG_HOME`
#    neovim will look for $XDG_CONFIG_HOME=/nvim/init.lua
#    :help config, default path: ~/.config/nvim/init.lua

# ----------------- vps server via ssh -----------------------
# 2) :checkhealth
#   i) if using kitty, copy xterm-kitty to server
#     -> remote server needs to know about terminal-info, terminal-type; most of them does not recognize kitty
#     -> kitty stores it's terminal info in xterm-kitty, which you can find with `find ~/.local/kitty -name "*xterm-kitty*"` 
#         if you not sure about path check kitty-path using `which kitty`
#     -> copy this xterm-kitty to `/usr/share/terminfo/x` on vps-server
