" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.local/share/nvim/plugged')

" Make sure you use single quotes

Plug 'fatih/vim-go'
Plug 'nsf/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sbdchd/neoformat'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'elmcast/elm-vim'

" Initialize plugin system
call plug#end()

" autoformatting notes
" using shfmt (go app) for shell formatting

let g:jsx_ext_required = 0
let g:go_fmt_command = "goimports"
let g:elm_format_autosave = 1

" let g:neoformat_enabled_c = ['clang']
let g:neoformat_c_clang = {
            \ 'exe': 'clang-format',
            \ 'args': ['--style="{BasedOnStyle: llvm, IndentWidth: 8, UseTab: Always, BreakBeforeBraces: Linux, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false}"'],
            \ 'stdin': 1,
            \ }

let g:neoformat_c_astyle = {
            \ 'exe': 'astyle',
            \ 'args': ['--mode=c', '--style=linux', '--indent=tab'],
            \ 'stdin': 1,
            \ }

autocmd BufWritePre *.js,*.jsx,*.sh Neoformat
autocmd BufRead,BufNewFile *.js,*.jsx set ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.elm set ts=4 sw=4 expandtab
autocmd BufRead,BufNewFile *.yml set ts=2 sw=2 expandtab
autocmd FileType sh set ts=2 sw=2 expandtab nosmartindent autoindent
autocmd BufRead,BufNewFile *.c,*.h set ts=8 sw=8 noexpandtab

let mapleader=","
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>
nmap <leader>b :CtrlPBuffer <cr>
nmap <leader>p :CtrlP <cr>
nmap <leader>f :NERDTreeToggle <cr>

set hlsearch


