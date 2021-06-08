#!/bin/bash
# auth imcooder@qq.com

set -x
set -e
#set -o pipefail
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VIM_DIR="$HOME/.vim"
BUNDLE_DIR="$VIM_DIR/bundle"
echo "mkdir .vim"
mkdir -p $BUNDLE_DIR || true
echo "source dir ${BIN_DIR}"
ln -sf "${BIN_DIR}/vimrc" ~/.vimrc
echo "install bundle"
mkdir -p "${BUNDLE_DIR}"
cp -r ./vim/* $VIM_DIR
cd ${BUNDLE_DIR}
git clone https://github.com/VundleVim/Vundle.vim.git
echo "finish"

