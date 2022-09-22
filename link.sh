#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s ${BASEDIR}/zshrc ~/.zshrc
curl -L git.io/antigen > ~/.local/share/antigen.zsh
ln -s ${BASEDIR}/vimrc ~/.vimrc
