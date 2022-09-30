#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -sf ${BASEDIR}/zshrc ~/.zshrc
curl -L git.io/antigen > ~/.local/share/antigen.zsh
ln -sf ${BASEDIR}/vimrc ~/.vimrc
mkdir -p ~/.config
ln -sf ${BASEDIR}/nvim ~/.config/nvim/
