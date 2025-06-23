#!/bin/bash
set -x
### Bash Config ###
cat << 'EOF' >> ~/.bashrc
# Enable colors in ls and grep
alias ls='ls --color=auto'
alias grep='grep --color=auto'
export LS_COLORS="di=1;34:fi=0:ln=1;36:pi=40;33:so=1;35:bd=1;33:cd=1;33:or=1;31:ex=1;32:*.sh=1;32"
PS1="\[\e[1;32m\]\u@\h \[\e[1;34m\]\w\[\e[0m\] \$ "

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

### tmux config ###
cat << 'EOF' > ~/.tmux.conf
bind c new-window -c "#{pane_current_path}"
bind '"' split-window -c "#{pane_current_path}"
bind % split-window -h -c "#{pane_current_path}"
EOF

# Apply changes
source ~/.bashrc
tmux source-file ~/.tmux.conf
git config --global credential.helper cache
# default timeout is 15 minutes; set to 1 hour (3600 seconds)
git config --global credential.helper 'cache --timeout=3600'
