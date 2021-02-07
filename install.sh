#!/bin/bash
# auth imcooder@qq.com

set -x
set -e
#set -o pipefail
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUNDLE_DIR="~/.vim/bundle"
echo "mkdir .vim"
echo "source dir ${BIN_DIR}"
ln -sf "${BIN_DIR}/vimrc" ~/.vimrc
echo "install bundle"
mkdir -p "${BUNDLE_DIR}"
cd ${BUNDLE_DIR}
git clone https://github.com/VundleVim/Vundle.vim.git
echo "finish"

