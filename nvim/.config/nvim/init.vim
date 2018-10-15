" must install minpac manually:
" https://github.com/k-takata/minpac
" call minpac#update()
" call minpac#clean()
" :messages (can be used to view minpac log)

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('fatih/vim-go')
" run GoInstallBinaries

call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')

call minpac#add('sbdchd/neoformat')
" neoformat is use to format shell files
" go get -u mvdan.cc/sh/cmd/shfmt

call minpac#add('scrooloose/nerdtree')

call minpac#add('ctrlpvim/ctrlp.vim')
" <c-f> and <c-b> to cycle between modes (files, buffers, etc)
" <c-d> to switch between filename only search instead of full path
" <c-r> to switch between regex modes
" , p to bring up CtrlP

call minpac#add('fholgado/minibufexpl.vim')
call minpac#add('elmcast/elm-vim')
call minpac#add('stevearc/vim-arduino')
call minpac#add('vim-scripts/indentpython.vim')
call minpac#add('rust-lang/rust.vim')

" uses eslint with javascript to highlight problems
" npm install eslint --save-dev
" ./node_modules/.bin/eslint --init
call minpac#add('majutsushi/tagbar')
call minpac#add('tpope/vim-fugitive')

call minpac#add('w0rp/ale')
" npm install -g prettier eslint typescript
" tsserver is required for ALEGotToDefinition
" <leader>d -- go to definition, Ctrl-o goes back
" would be nice to map this to ctrl-] like most other languages

let g:jsx_ext_required = 0

let g:go_fmt_command = "goimports"
let g:go_addtags_transform = 'camelcase'

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

" trying to move shfmt to ALE but not working yet
autocmd BufWritePre,TextChanged,InsertLeave init,*.sh Neoformat

autocmd BufRead,BufNewFile *.js,*.jsx set ts=2 sw=2 expandtab
autocmd BufRead,BufNewFile *.elm set ts=4 sw=4 expandtab
autocmd BufRead,BufNewFile *.m set ts=4 sw=4 expandtab
autocmd BufRead,BufNewFile *.yml set ts=2 sw=2 expandtab
autocmd FileType sh set ts=2 sw=2 expandtab nosmartindent autoindent
autocmd BufRead,BufNewFile *.c,*.h set ts=8 sw=8 noexpandtab

au BufNewFile,BufRead *.py set ts=4 softtabstop=4  sw=4 textwidth=79 expandtab  autoindent fileformat=unix

let mapleader=","
nmap <tab> :bn<cr>
nmap <s-tab> :bp<cr>
nmap <leader>b :CtrlPBuffer <cr>
nmap <leader>p :CtrlP <cr>
nmap <leader>f :NERDTreeToggle <cr>

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set hlsearch

" tab filename expansion
set wildmode=longest,list,full
set wildmenu

nmap <F8> :TagbarToggle<CR>

hi DiffText cterm=bold ctermbg=11 gui=bold guibg=Red

nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

"================================================
" ale stuff
" bash and ansible formatters are not working yet
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'markdown': ['prettier'],
\   'yaml': ['prettier'],
\   'bash': ['shfmt'],
\   'ansible': ['ansible-lint'],
\}

let g:ale_fix_on_save = 1
" Enable completion where available.
let g:ale_completion_enabled = 1
let g:ale_javascript_prettier_use_local_config = 1
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>d :ALEGoToDefinition<cr>

"only lint on save
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

set backupcopy=yes

"=================================================================================================
"nvim notes
" :nmap for normal mode mappings
" :vmap for visual mode mappings
" :imap for insert mode mappings
