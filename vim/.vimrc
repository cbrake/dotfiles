" An example for a gvimrc file.
" The commands in this are executed when the GUI is started.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2001 Sep 02
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.gvimrc
"	      for Amiga:  s:.gvimrc
"  for MS-DOS and Win32:  $VIM\_gvimrc
"	    for OpenVMS:  sys$login:.gvimrc

" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

"set t_Co=256

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'fatih/vim-go'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
let g:go_fmt_command = "goimports"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required to use indent from plugins

call pathogen#infect()

set wildmode=longest,list,full
set wildmenu

" set the X11 font to use
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
" set guifont=Monospace\ 11  
set guifont=Liberation\ Mono\ 11

"set ch=2		" Make command line two lines high

"set mousehide		" Hide the mouse when typing text
set nomousehide

set mouse=a

" required for eclim
filetype plugin on
set nocompatible
nnoremap <silent> <buffer> <cr> :CSearchContext<cr>
let g:EclimProjectKeepLocalHistory = 1

"switch next and previous buffer
let mapleader=","
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>
nmap <leader>b :CtrlPBuffer <cr>
nmap <leader>p :CtrlP <cr>
nmap <leader>f :NERDTreeToggle <cr>

let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

au FileType lisp set lisp
"au FileType lisp set autoindent
au FileType lisp set showmatch
au FileType lisp set cpoptions-=m
au FileType lisp set shiftwidth=1
au FileType lisp set foldmethod=indent

au FileType sh set ts=2 sw=2 expandtab nosmartindent autoindent

autocmd BufRead,BufNewFile *.rb set ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.go set ts=8 sw=8 noexpandtab

autocmd BufRead,BufNewFile *.js set ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.css set ts=2 sw=2 expandtab smartindent
autocmd BufRead,BufNewFile *.jsx set ts=2 sw=2 expandtab

" not sure why the following hack is needed
autocmd BufRead,BufNewFile *.jade so ~/.vim/indent/jade.vim

" not sure why the followin is needed
autocmd BufRead,BufNewFile *.qml so ~/.vim/syntax/qml.vim
autocmd BufRead,BufNewFile *.qml set smartindent ts=4 sw=4 expandtab

autocmd BufRead,BufNewFile *.rhtml set ts=2 sw=2 expandtab

autocmd BufRead,BufNewFile *.html set ts=2 sw=2 expandtab

autocmd BufRead,BufNewFile *.cst set ts=2 sw=2 expandtab

autocmd BufRead,BufNewFile *.py set ts=4 sw=4 expandtab softtabstop=4
autocmd BufRead,BufNewFile *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

autocmd BufRead,BufNewFile *.bb set ts=4 sw=4 expandtab autoindent

autocmd BufRead,BufNewFile *.c,*.h,*.cpp,*.hpp set cindent formatoptions=tclron ts=8 sw=8 noexpandtab cinoptions=:0,l1,t0,g0 textwidth=100

autocmd BufRead,BufNewFile */sVsGUI*/*.c set ts=2 sw=2 expandtab softtabstop=2
autocmd BufRead,BufNewFile */sVsGUI*/*.h set ts=2 sw=2 expandtab softtabstop=2
autocmd BufRead,BufNewFile */sVsGUI*/*.cpp set ts=2 sw=2 expandtab softtabstop=2
autocmd BufRead,BufNewFile */sVsGUI*/*.hpp set ts=2 sw=2 expandtab softtabstop=2

autocmd BufRead,BufNewFile */svs*/*.c set ts=2 sw=2 expandtab softtabstop=2
autocmd BufRead,BufNewFile */svs*/*.h set ts=2 sw=2 expandtab softtabstop=2
autocmd BufRead,BufNewFile */svs*/*.cpp set ts=2 sw=2 expandtab softtabstop=2
autocmd BufRead,BufNewFile */svs*/*.hpp set ts=2 sw=2 expandtab softtabstop=2

autocmd BufRead,BufNewFile */oki-package-rework*/*.h set ts=4 sw=4 expandtab softtabstop=4 cinoptions=:0,l1,t0,g0 textwidth=100
autocmd BufRead,BufNewFile */oki-package-rework*/*.cpp set ts=4 sw=4 expandtab softtabstop=4 cinoptions=:0,l1,t0,g0 textwidth=100

au BufRead,BufNewFile *.hbs set filetype=html ts=2 sw=2 expandtab

au BufRead,BufNewFile *.vala set filetype=cs ts=4 sw=4 expandtab cindent softtabstop=2
au BufRead,BufNewFile *.ino set filetype=cpp ts=2 sw=2 expandtab cindent softtabstop=2

autocmd BufRead,BufNewFile *.cs set ts=4 sw=4 expandtab cindent

"autocmd BufRead *.vala set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
"autocmd BufRead *.vapi set efm=%f:%l.%c-%[%^:]%#:\ %t%[%^:]%#:\ %m
"au BufRead,BufNewFile *.vala            setfiletype vala
"au BufRead,BufNewFile *.vapi            setfiletype vala

"autocmd BufRead,BufNewFile *.vala set ts=4
"autocmd BufRead,BufNewFile *.vala set sw=4
"autocmd BufRead,BufNewFile *.vala set expandtab
"autocmd BufRead,BufNewFile *.vala set cindent
" au Syntax vala source /usr/share/vim/vim71/syntax/cs.vim

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" I like highlighting strings inside C comments
let c_comment_strings=1

" Switch on syntax highlighting if it wasn't on yet.
if !exists("syntax_on")
syntax on
endif

" Switch on search pattern highlighting.
set hlsearch

" For Win32 version, have "K" lookup the keyword in a help file
"if has("win32")
"  let winhelpfile='windows.hlp'
"  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
"endif


" Visual star
xnoremap * :<C-u>call <SID>VSetSearch()<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch()<CR>?<C-R>=@/<CR><CR>

function! s:VSetSearch()
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, '/\'), '\n', '\\n', 'g')
  let @s = temp
endfunction

let g:jsx_ext_required = 0

