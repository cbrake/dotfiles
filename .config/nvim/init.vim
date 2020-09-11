" ==================================================
" must install minpac manually:
" https://github.com/k-takata/minpac
" call minpac#update() (run this occasionally to update vim plugins)
" call minpac#clean()
" :messages (can be used to view minpac log)

packadd minpac
call minpac#init()

call minpac#add('k-takata/minpac', {'type': 'opt'})

" =================================================
" coc setup
" :CocInstall coc-json coc-tsserver  coc-css coc-eslint coc-git coc-go coc-html coc-python coc-sh coc-yaml coc-cmake coc-prettier
" extensions are installed at ~/.config/coc/extensions/node_modules/
" sudo npm install -g @elm-tooling/elm-language-server
" --unsafe-perm may be required for npm 
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

" call minpac#add('elm-tooling/elm-vim')
call minpac#add('andys8/vim-elm-syntax', { 'for': ['elm'] }) 

" call minpac#add('fatih/vim-go')
" run GoInstallBinaries
" occasionally run GoUpdateBinaries
" go get -u github.com/posener/complete/gocomplete

"call minpac#add('pangloss/vim-javascript')
"call minpac#add('mxw/vim-jsx')

call minpac#add('MaxMEllon/vim-jsx-pretty')

call minpac#add('sbdchd/neoformat')
" neoformat is use to format shell files
" go get -u mvdan.cc/sh/cmd/shfmt
" shellcheck is used to lint shell files (I don't think this is working any
" more -- used to use ALE)
" https://github.com/koalaman/shellcheck#installing

call minpac#add('scrooloose/nerdtree')

call minpac#add('itchyny/lightline.vim')

call minpac#add('ctrlpvim/ctrlp.vim')
" <c-f> and <c-b> to cycle between modes (files, buffers, etc)
" <c-d> to switch between filename only search instead of full path
" <c-r> to switch between regex modes
" , p to bring up CtrlP

call minpac#add('fholgado/minibufexpl.vim')
" npm install -g elm-test elm-oracle elm-format
" call minpac#add('bitterjug/vim-tagbar-ctags-elm')

call minpac#add('stevearc/vim-arduino')
" call minpac#add('vim-scripts/indentpython.vim')
" call minpac#add('rust-lang/rust.vim')
call minpac#add('kergoth/vim-bitbake')

" uses eslint with javascript to highlight problems
" npm install eslint --save-dev
" ./node_modules/.bin/eslint --init
call minpac#add('majutsushi/tagbar')
call minpac#add('tpope/vim-fugitive')

" call minpac#add('w0rp/ale')
" npm install --save-dev prettier eslint typescript
" pacman -S jq (autoformat json)
" tsserver (typescript) is required for ALEGotToDefinition
" <leader>d -- go to definition, Ctrl-o goes back
" would be nice to map this to ctrl-] like most other languages

" vim-lastplace remembers where you were in file during last edit
call minpac#add('farmergreg/vim-lastplace')

" required to fix highlight colors with solaraized color scheme
call minpac#add('matsen/nvim-colors-solarized')

call minpac#add('vim-scripts/a.vim')

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

"=============================================================
" coc stuff

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
"xmap <leader>f  <Plug>(coc-format-selected)
"nmap <leader>f  <Plug>(coc-format-selected)


augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
set statusline=
set statusline^=%{coc#status()}
set statusline+=%#LineNr#
set statusline+=\ %f


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

autocmd BufWritePre *.go :call CocAction('organizeImport')
