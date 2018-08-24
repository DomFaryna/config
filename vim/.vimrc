if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Use vim, not vi
set nocompatible

"Allow backspacing to work normally
set backspace=indent,eol,start

"Turn on fancy colour
syntax enable

"Check if file is Jenkinsfile. If so, turn on syntaxa
if @% =~# 'Jenkinsfile'
    set syntax=groovy
endif

"Allow vim to open different files
filetype plugin on
set number
set path +=**
set wildmenu

"Create a maketags file on vim startuo
command! MakeTags !ctags -R .

"Make vim into a file browser
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

""""" Tab stuff

"Allow 4 spaces instead of tabs
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
" Add fun lines on a tab, good for visulizing
set listchars=tab:\|·,trail:·


"Makes it so that p doesn't copy whatever was pasted over it
xnoremap p "_dP

"""""" Plugins
call plug#begin('~/.vim/plugged')
Plug 'pearofducks/ansible-vim'
Plug 'tarekbecker/vim-yaml-formatter'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

""""" Autoformat json
com! FormatJSON %!python -m json.tool
