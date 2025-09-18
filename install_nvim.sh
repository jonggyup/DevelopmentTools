#!/usr/bin/env bash

echo "[*] Installing dependencies"
sudo apt update
sudo apt install -y ninja-build gettext cmake unzip curl build-essential git


sudo apt install -y nodejs npm

# Install nvm if not installed
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
source ~/.nvm/nvm.sh

# Install and use a compatible Node.js version
nvm install 18
nvm use 18

# Retry installation
npm install -g tree-sitter-cli

echo "[*] Cloning Neovim repository"
git clone https://github.com/neovim/neovim.git
pushd neovim

echo "[*] Checking out latest stable release"
git checkout stable  # use `nightly` for the latest features

echo "[*] Building Neovim"
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

echo "[*] Done. Verifying version..."
nvim --version

popd

mkdir -p ~/.config
cp ./nvim ~/.config/nvim -r
