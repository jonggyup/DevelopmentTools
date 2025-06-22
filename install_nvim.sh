#!/usr/bin/env bash
set -e

echo "[*] Installing dependencies"
sudo apt update
sudo apt install -y ninja-build gettext cmake unzip curl build-essential git

echo "[*] Cloning Neovim repository"
git clone https://github.com/neovim/neovim.git
cd neovim

echo "[*] Checking out latest stable release"
git checkout stable  # use `nightly` for the latest features

echo "[*] Building Neovim"
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

echo "[*] Done. Verifying version..."
nvim --version

