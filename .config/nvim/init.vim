" ==================================================
" must install minpac manually:
" https://github.com/k-takata/minpac
" call minpac#update() (run this occasionally to update vim plugins)
" call minpac#clean()
" :messages (can be used to view minpac log)

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

call minpac#add('fatih/vim-go')
" run GoInstallBinaries
" occasionally run GoUpdateBinaries
" go get -u github.com/posener/complete/gocomplete

call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')

call minpac#add('sbdchd/neoformat')
" neoformat is use to format shell files
" go get -u mvdan.cc/sh/cmd/shfmt
" shellcheck is used to lint shell files
" https://github.com/koalaman/shellcheck#installing

call minpac#add('scrooloose/nerdtree')

call minpac#add('ctrlpvim/ctrlp.vim')
" <c-f> and <c-b> to cycle between modes (files, buffers, etc)
" <c-d> to switch between filename only search instead of full path
" <c-r> to switch between regex modes
" , p to bring up CtrlP

call minpac#add('fholgado/minibufexpl.vim')
call minpac#add('elmcast/elm-vim')
call minpac#add('antew/vim-elm-language-server')
" npm install -g elm-test elm-oracle elm-format
" call minpac#add('bitterjug/vim-tagbar-ctags-elm')

call minpac#add('stevearc/vim-arduino')
call minpac#add('vim-scripts/indentpython.vim')
call minpac#add('rust-lang/rust.vim')
call minpac#add('kergoth/vim-bitbake')

" uses eslint with javascript to highlight problems
" npm install eslint --save-dev
" ./node_modules/.bin/eslint --init
call minpac#add('majutsushi/tagbar')
call minpac#add('tpope/vim-fugitive')

call minpac#add('w0rp/ale')
" npm install --save-dev prettier eslint typescript
" pacman -S jq (autoformat json)
" tsserver (typescript) is required for ALEGotToDefinition
" <leader>d -- go to definition, Ctrl-o goes back
" would be nice to map this to ctrl-] like most other languages

call minpac#add('kylef/apiblueprint.vim')

" vim-lastplace remembers where you were in file during last edit
call minpac#add('farmergreg/vim-lastplace')

" required to fix highlight colors with solaraized color scheme
call minpac#add('matsen/nvim-colors-solarized')

call minpac#add('vim-scripts/a.vim')

call minpac#add('dart-lang/dart-vim-plugin')

" end minpac stuff
" =======================================================

let g:jsx_ext_required = 0

let g:go_fmt_command = "goimports"
let g:go_addtags_transform = 'camelcase'
let g:go_def_mode = 'godef'

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
autocmd BufWritePre init,*.sh Neoformat

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
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>

"================================================
" ale stuff
" bash and ansible formatters are not working yet
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'json': ['prettier'],
\   'markdown': ['prettier'],
\   'yaml': ['prettier'],
\   'bash': ['shfmt'],
\   'ansible': ['ansible-lint'],
\}

let g:ale_fix_on_save = 1
" Enable completion where available.
" let g:ale_completion_enabled = 1
let g:ale_javascript_prettier_use_local_config = 1
nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>
nmap <silent> <leader>d :ALEGoToDefinition<cr>

"only lint on save
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

set backupcopy=yes

"enable mouse
set mouse=a

" disable ALE with C/C++
let g:ale_linters = {'c': [], 'cpp': [], 'c++': [], 'go': ['golint', 'go build']}

" Dart stuff
let dart_html_in_string=v:true
let g:dart_style_guide = 2
let g:dart_format_on_save = 1

"=================================================================================================
"nvim notes
" :nmap for normal mode mappings
" :vmap for visual mode mappings
" :imap for insert mode mappings

" config for nvim-colors-solarized
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set background=light " or light
colorscheme solarized

" this allows you to move cursor past last cursor.
" see: https://keleshev.com/my-book-writing-setup/
" set virtualedit=all
