#!/usr/bin/env bash

function die() {
    echo "Error: %1" >&2
    exit 1
}

# Check for neovim
NVIM_BIN=$(which nvim)

if [[ ! -x $NVIM_BIN ]]; then
    die "neovim is not installed, please install for your platform."
fi


# Install vim-plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


CONFIG_DIR="$HOME/.config/nvim"

# Move config if it exists, else create it

if [[ -d $CONFIG_DIR ]]; then
    echo "Moving existing configuration to backup..."
    mv $CONFIG_DIR ${CONFIG_DIR}.bak
else
    echo "Creating config dir..."
    mkdir -p $HOME/.config
fi

# Clone into correct location
echo "Cloning..."
git clone git@github.com:a10y/nvim-config.git $CONFIG_DIR

echo "Done!"
echo "Start vim and run :PlugInstall to get up and running!"

