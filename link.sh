#!/bin/bash

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

ln -s ${BASEDIR}/zshrc ~/.zshrc
ln -s ${BASEDIR}/vimrc ~/.vimrc
