#!/bin/bash

### Bash Config ###
cat << 'EOF' >> ~/.bashrc
# Enable colors in ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
export LS_COLORS="di=1;34:fi=0:ln=1;36:pi=40;33:so=1;35:bd=1;33:cd=1;33:or=1;31:ex=1;32:*.sh=1;32"

# Colored prompt
alias vim='nvim'
export PATH="$HOME/.local/bin:$PATH"

EOF

### Vim Config ###
mkdir -p ~/.vim/colors
cat << 'EOF' > ~/.vimrc
syntax on
set t_Co=256
set background=dark
colorscheme desert
EOF

# Download 'desert' colorscheme if not present
curl -fsSL -o ~/.vim/colors/desert.vim https://raw.githubusercontent.com/vim/colorschemes/master/colors/desert.vim

# Apply changes
source ~/.bashrc

