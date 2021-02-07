#!/bin/bash
# auth imcooder@qq.com

set -x
set -e
#set -o pipefail
<<<<<<< HEAD
BIN_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BUNDLE_DIR="~/.vim/bundle"
echo "mkdir .vim"
echo "source dir ${BIN_DIR}"
=======
BIN_DIR="$(cd "$( dirname "$0")" && pwd)"
BUNDLE_DIR=~/.vim/bundle
echo "mkdir .vimrc"
>>>>>>> 94c082ae749a90574431949126cd22fb5a4f4689
ln -sf "${BIN_DIR}/vimrc" ~/.vimrc
echo "install bundle"
mkdir -p "${BUNDLE_DIR}"
cd ${BUNDLE_DIR}
git clone https://github.com/VundleVim/Vundle.vim.git
echo "finish"

