"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: imcooder@qq.com
" Source: https://github.com/imcooder/dotvim

" genernal settings
syntax enable
syntax on
set t_Co=256
set cul
set cursorline
set shortmess=atI
autocmd InsertEnter * se cul
set ruler
set showcmd
set scrolloff=3
set laststatus=2
set autoindent
set smartindent
set cindent
set cinoptions=g0,:0,N-s,(0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set colorcolumn=100
highlight ColorColumn ctermbg=233
set noexpandtab
set smarttab
set number
set history=1000
set hlsearch
set incsearch
set smartcase
set ff=unix
set langmenu=zh_CN.UTF-8
set helplang=cn
set cmdheight=2
set autoread
set completeopt=preview,menu
set autowrite
set magic
set guioptions-=T
set guioptions-=m
set nocompatible
set noeb
set confirm
set nobackup
set noswapfile
set ignorecase
set linespace=0
set wildmenu
set backspace=2
set whichwrap+=<,>,h,l
set mouse=v
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set completeopt=longest,menu
set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf-8,cp936
set clipboard=unnamed
filetype on
filetype plugin on
filetype indent on

" create file ettings
autocmd BufNewFile *.cpp,*.cc,*.c,*.hpp,*.h,*.sh,*.py exec ":call SetTitle()"
func! SetTitle()
    if expand("%:e") == 'sh'
        call setline(1,"\#!/bin/bash")
        call append(line("."), "")
    elseif expand("%:e") == 'py'
        call setline(1,"#!/usr/bin/env python")
        call append(line("."),"# coding=utf-8")
        call append(line(".")+1, "")
    elseif expand("%:e") == 'cpp'
        call setline(1,"#include <iostream>")
        call append(line("."), "")
    elseif expand("%:e") == 'cc'
        call setline(1,"#include <iostream>")
        call append(line("."), "")
    elseif expand("%:e") == 'c'
        call setline(1,"#include <stdio.h>")
        call append(line("."), "")
    elseif expand("%:e") == 'h'
        call setline(1, "#ifndef _".toupper(expand("%:r"))."_H")
        call setline(2, "#define _".toupper(expand("%:r"))."_H")
        call setline(3, "#endif")
    elseif expand("%:e") == 'hpp'
        call setline(1, "#ifndef _".toupper(expand("%:r"))."_H")
        call setline(2, "#define _".toupper(expand("%:r"))."_H")
        call setline(3, "#endif")
    endif
endfunc
autocmd BufNewFile * normal G
"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"回车即选中当前项
" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'chxuan/change-colorscheme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Valloric/MatchTagAlways'
Plugin 'ycm-core/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'vim-syntastic/syntastic'
Plugin 'docunext/closetag.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tacahiroy/ctrlp-funky'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airlin-themes'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/awk.vim'
" Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'vim-scripts/txt.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'will133/vim-dirdiff'
Plugin 'haya14busa/incsearch.vim'
Plugin 'mhinz/vim-startify'
Plugin 'airblade/vim-gitgutter'
Plugin 'hushicai/fecs.vim.git'
Plugin 'mileszs/ack.vim'
Plugin 'inkarkat/vim-ingo-library'
" Plugin 'itchyny/vim-cursorword'
Plugin 'dominikduda/vim_current_word'
Plugin 'wsdjeg/FlyGrep.vim'
Plugin 'zivyangll/git-blame.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'fatih/vim-go'
call vundle#end()
filetype plugin indent on

" load vim default plugin
runtime macros/matchit.vim
" automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

" change-colorscheme
map <F10> :NextColorScheme<CR>
imap <F10> <ESC> :NextColorScheme<CR>
map <F9> :PreviousColorScheme<CR>
imap <F9> <ESC> :PreviousColorScheme<CR>

" nerdtree
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
let g:NERDTreeChDirMode = 2
" 忽略一下文件的显示
let NERDTreeIgnore=['\.pyc','\~$','\.swp', '\.DS_Store', '\.a', '\.so', '\.a', '\.o']
" 显示行号
let NERDTreeShowLineNumbers=1
" 设置宽度
let NERDTreeWinSize=31
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
"是否显示隐藏文件
"let NERDTreeShowHidden=1
" 显示书签列表
let NERDTreeShowBookmarks=1
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }
" Doxygen
let g:DoxygenToolkit_authorName="imcooder@gmail.com"
let s:licenseTag = "Copyright(C)\<enter>"
let s:licenseTag = s:licenseTag . "For free\<enter>"
let s:licenseTag = s:licenseTag . "All right reserved\<enter>"
let g:DoxygenToolkit_licenseTag = s:licenseTag
let g:DoxygenToolkit_briefTag_funcName="yes"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_commentType="Qt"

" YCM https://github.com/Valloric/YouCompleteMe/
" let g:ycm_server_python_interpreter='/usr/bin/python'
" let g:ycm_path_to_python_interpreter='python'
" let g:ycm_python_binary_path = 'python'
let g:ycm_global_ycm_extra_conf = '.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
" 语法关键字补全
let g:ycm_seed_identifiers_with_syntax = 1
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
" 禁止缓存匹配项,每次都重新生成匹配项
"let g:ycm_cache_omnifunc = 0
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
" 从第2个键入字符就开始罗列匹配项
let g:ycm_min_num_of_chars_for_completion=2
" 开启 YCM 基于标签引擎
" let g:ycm_collect_identifiers_from_tags_files=1
let mapleader = ","
"nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
nnoremap <leader>o :YcmCompleter GoToInclude<CR>
"map<F11> :YcmCompleter GotoInclude<CR> imap<F11> :YcmCompleter
"GotoInclude<CR>

"nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <F5> :YcmDiags<CR>
map <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
imap <F12> :YcmCompleter GoToDefinitionElseDeclaration<CR>
" a.vim: .h -> .cpp or .cpp -> .h
nnoremap <silent> <F2> :A<CR>
imap <F2> <ESC> :A<CR>

" tagbar
" 默认使用路径中
" let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
" set updatetime=100
let g:tagbar_show_linenumbers = 1 " 显示绝对行号
autocmd VimEnter * nested :call tagbar#autoopen(1)
map <F4> :TagbarToggle<CR>
imap <F4> <ESC> :TagbarToggle<CR>

" colorscheme
set background=light
let g:solarized_termcolors=256
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:solarized_hitrail=0
"set termguicolors
colorscheme monokai
" colorscheme solarized8_high

" cpp_class_scope_highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1

" bind Ctrl+<movement> keys to move around the windows, instead of using
" Ctrl+w + <movement>
" " Every unnecessary keystroke that can be saved is good for your health :)
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
let mapleader = ","
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>
" airline
let g:airline_theme="luna"
let g:airline_powerline_fonts = 1
set lazyredraw
set laststatus=2
set t_Co=256
"let g:airline_section_b = '%{strftime("%c")}'
"let g:airline_section_y = 'BN: %{bufnr("%")}'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '▶'
let g:airline_left_alt_sep = '❯'
let g:airline_right_sep = '◀'
let g:airline_right_alt_sep = '❮'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.readonly = ''



" 不建议首次打开文件时进行检查
let g:syntastic_check_on_open = 1
" `:wq`时不进行检查，注意这跟`:w`不一样
let g:syntastic_check_on_wq = 0
" 如果你想在写文件时不进行检查，需要配置`passive`模式
" 在`passive`模式下，只有手动调用了`:SyntasticCheck`才会触发检查
" let g:syntastic_mode_map = {'mode': 'passive'}
" 你可以配置一个快捷方式，用来快速检查当前文件
" nmap <silent> <F5> :SyntasticCheck<cr>
let g:syntastic_javascript_checkers = ['eslint','jshint']
let g:syntastic_javascript_eslint_exec = "npm run lint --"
let g:syntastic_javascript_fecs_args = "--reporter=baidu"
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

map <F7> :bp<CR>
imap <F7> <ESC> :bp<CR>
map <F8> :bn<CR>
imap <F8> <ESC> :bn<CR>

" nnoremap <C-p> :bn<CR>
" nnoremap <C-N> :bp<CR>
noremap <silent><C-tab> <ESC>:tabprev<CR>
" ctrlp
let g:ctrlp_max_height = 20
let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = '0'
let g:ctrlp_max_depth=40
let g:ctrlp_follow_symlinks=1
let g:ctrlp_max_files = ''
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.gz,*.tar     " MacOSX/Linux
set wildignore+=*.o,*.so,*.a,*.un~
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
map <F11> :CtrlPBufTag<CR>
imap <F11> <ESC> :CtrlPBufTag<CR>
" vim-devicons
" set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Nerd\ Font\ Complete\ 12
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
let g:ctrlp_funky_syntax_highlight = 1
"
let g:ctrlp_extensions = ['funky']
let g:ctrlp_funky_matchtype = 'path'
" synatastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
" easier formatting of paragraphs
vmap Q gq
nmap Q gqap
"
"
"
" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" 去掉搜索高亮
"noremap <silent><leader>/ :nohls<CR>
map <leader>/ :nohls<CR>

map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" vim_current_word
hi CurrentWord gui=underline ctermbg=NONE cterm=underline
hi CurrentWordTwins gui=underline cterm=underline

" FlyGrep
nnoremap <Space>s/ :FlyGrep<cr>

" git-blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>
" jedi
let g:jedi#completions_enabled = 1

" go
let g:go_fmt_command = "goimports"
let g:go_fmt_fail_silently = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_echo_go_info = 0
let g:go_metalinter_autosave=1
"
"
"" QuickFix
nmap <leader>co :QFix<CR>
nmap <leader>ct :call QFixToggle(1)<CR>
command! -bang -nargs=? QFix call QFixToggle(<bang>0)
map <F6> : call QFixToggle(1)<CR>
imap <F6> <ESC> :call QFixToggle(1)<CR>

function! QFixToggle(forced)
    if exists("g:qfix_win") && a:forced != 0
        cclose
    else
        if exists("g:my_quickfix_win_height")
            execute "copen ".g:my_quickfix_win_height
        else
            copen
        endif
    endif
endfunction

augroup QFixToggle
    autocmd!
    autocmd BufWinEnter quickfix let g:qfix_win = bufnr("$")
    autocmd BufWinLeave * if exists("g:qfix_win") && expand("<abuf>") == g:qfix_win | unlet! g:qfix_win | endif
augroup END
"

autocmd FileType c,cpp,html,js,python,javascript,json,conf,sh setlocal expandtab tabstop=4 softtabstop=4 shiftwidth=4
autocmd FileType make setlocal noexpandtab
autocmd FileType dict setlocal noexpandtab
autocmd FileType text setlocal noexpandtab

