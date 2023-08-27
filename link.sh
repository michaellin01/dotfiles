#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf ${BASEDIR}/zshrc ~/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
ln -sf ${BASEDIR}/vimrc ~/.vimrc
ln -sf ${BASEDIR}/tmux.conf ~/.tmux.conf
mkdir -p ~/.config
ln -sf ${BASEDIR}/nvim ~/.config/nvim
curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

apt install rg
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
ln -sf ${BASEDIR}/p10k.zsh ~/.p10k.zsh
nvim --headless +PlugInstall +qall
