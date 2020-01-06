filetype off

set showcmd

" scroll when within 8 lines of edge
set scrolloff=8

"-------------------------------------------------------------------------------
" PLUGINS
"-------------------------------------------------------------------------------
call plug#begin()

" Plug 'Shougo/vimproc.vim', {'do': 'make'}
" Plug 'Shougo/vimshell.vim'
" Plug 'Shougo/unite.vim'
" Plug 'Shougo/neomru.vim'
" Plug 'Shougo/unite-outline'
" Plug 'tsukkee/unite-tag'
" Plug 'rstacruz/vim-fastunite'
" Plug 'Shougo/neoyank.vim'
" Plug 'justinmk/vim-sneak'
" Plug 'chrisbra/Colorizer'
" Plug 'tpope/vim-endwise' " doesn't work with non-standard syntax highlighting =/

" COLORS
"-------------------------------------------------------------------------------
" Plug 'atelierbram/vim-colors_duotones'
Plug 'chriskempson/base16-vim'
" Plug 'junegunn/rainbow_parentheses.vim'
" Plug 'lilydjwg/colorizer' -- super cool but causes weird flickering in insert mode =/

" LANGUAGES
"-------------------------------------------------------------------------------
" Plug 'sheerun/vim-polyglot'
Plug 'tbastos/vim-lua'
Plug 'mattn/emmet-vim'
Plug 'larsbs/vim-xmll'
Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
" Plug 'prettier/vim-prettier', { 'tag': '0.0.15' }
Plug 'prettier/vim-prettier', {
  \ 'tag': '0.2.7',
  \ 'do': 'yarn install',
  \ }
" Plug 'flowtype/vim-flow'

" OTHER
"-------------------------------------------------------------------------------
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'wincent/ferret'
Plug 'tomtom/tcomment_vim'
Plug 'coderifous/textobj-word-column.vim'
Plug 'jwhitley/vim-matchit'
Plug 'tpope/vim-abolish'
Plug 'ivyl/vim-bling'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', {'dir': $XDG_CACHE_HOME . '/fzf', 'do': './install --all'}
Plug 'Raimondi/delimitMate'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'junegunn/vim-easy-align'
Plug 'junegunn/goyo.vim'
Plug 'w0rp/ale'
Plug 'vim-scripts/DrawIt'
Plug 'qpkorr/vim-renamer'
" Plug 'baverman/vial'
" Plug 'baverman/vial-http'
" Plug 'MarcWeber/vim-addon-qf-layout'
" Plug 'chrisbra/csv.vim'

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" END PLUGINS
"-------------------------------------------------------------------------------
call plug#end()

"-------------------------------------------------------------------------------
" SPACING
"-------------------------------------------------------------------------------
set expandtab
set softtabstop=2
set shiftwidth=2
set nowrap
set nofoldenable

" show current line and relative lines above and below
set number
set relativenumber

"-------------------------------------------------------------------------------
" KEYS
"-------------------------------------------------------------------------------
let mapleader = " "
nnoremap <C-t> :FZF<CR>
" nnoremap gx :silent !xdg-open &>/dev/null <C-R>=escape("<C-R><C-F>","#?&;\|%")<CR><CR>:<C-c>
vnoremap <leader>w :'<,'>:w !xargs chromium &>/dev/null<CR>
nnoremap <leader>q :copen<CR>

" reload things
" reload vim
nnoremap <leader>rv :source $XDG_CONFIG_HOME/nvim/init.vim<CR>
" reload plugins
nnoremap <leader>rp :PlugUpdate<CR>

" clear all the things
nnoremap <leader>c :noh<CR>:<C-c>

" exit things
inoremap kj <ESC>
cnoremap kj <C-e><C-u><C-c>
inoremap kJ <ESC>
cnoremap kJ <C-e><C-u><C-c>
inoremap Kj <ESC>
cnoremap Kj <C-e><C-u><C-c>
inoremap KJ <ESC>
cnoremap KJ <C-e><C-u><C-c>

" automatically recenter
nnoremap n nzz
nnoremap N Nzz

" adjust shiftwidth
function! Adjust_shiftwidth(dir)
  if a:dir == 'up'
    set shiftwidth +=1
  elseif a:dir == 'down'
    set shiftwidth -=1
  endif
  echo 'shiftwidth =' &shiftwidth
endfunction
nnoremap <leader>> :call Adjust_shiftwidth('up')<CR>
nnoremap <leader>< :call Adjust_shiftwidth('down')<CR>

" other
nnoremap <C-n> O<Esc>j
nnoremap <C-m> o<Esc>k
nnoremap s <C-w>
map Q <Nop>
nnoremap Y y$
nnoremap K :grep "<C-R><C-W>"<CR>:cope<CR>
" :cw<CR>

" CLIPBOARD
"-------------------------------------------------------------------------------
vnoremap <silent> <leader>y :<CR>:let @a=@" \| execute "normal! vgvy" \| let res=system("pbcopy", @") \| let @"=@a<CR>

" PLUGINS
"-------------------------------------------------------------------------------
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)
" nnoremap <leader>G :Goyo<CR>

"-------------------------------------------------------------------------------
" QF-LAYOUT
"-------------------------------------------------------------------------------
" let g:vim_addon_qf_layout = {}
" let g:vim_addon_qf_layout.quickfix_formatters = [ 'vim_addon_qf_layout#DefaultFormatter' ]

"-------------------------------------------------------------------------------
" NEOMAKE
"-------------------------------------------------------------------------------
" let g:neomake_verbose = 3 " debug flag
" let g:neomake_logfile = '/tmp/neomake.log'
" let g:neomake_error_sign = { 'text': '!>', 'texthl': 'Error' }
" let g:neomake_warning_sign = { 'text': '?>', 'texthl': 'Warning' }

"-------------------------------------------------------------------------------
" NEOMAKE - ESLint
"-------------------------------------------------------------------------------
" let g:my_neomake_eslint_maker = {
"   \ 'args': [
"     \ '--format', 'compact',
"     \ '--cache',
"     \ '--cache-location', $XDG_CACHE_HOME . '/eslint'
"   \ ],
"   \ 'errorformat': '%f: line %l\, col %c\, %m'
" \ }
" let g:neomake_javascript_eslint_maker = g:my_neomake_eslint_maker
" let g:neomake_jsx_eslint_maker = g:my_neomake_eslint_maker
" let g:neomake_javascript_enabled_makers = []

" function! SetupESLint()
"   if !exists("b:eslint_is_setup")
"     let b:git_toplevel = systemlist('git rev-parse --show-toplevel')[0]
"     let b:eslint = b:git_toplevel . '/node_modules/.bin/eslint'
"     let b:eslint_static = b:git_toplevel . '/static/node_modules/.bin/eslint'
"     if executable(b:eslint)
"       call add(g:neomake_javascript_enabled_makers, 'eslint')
"       let b:neomake_javascript_eslint_exe = b:eslint
"     elseif executable(b:eslint_static)
"       call add(g:neomake_javascript_enabled_makers, 'eslint')
"       let b:neomake_javascript_eslint_exe = b:eslint_static
"     else
"       echomsg "ESLint not found"
"     endif
"     let b:eslint_is_setup = 1
"   endif
" endfunction

" function! SetupFlow()
"   if !exists("b:flow_is_setup")
"     let b:git_toplevel = systemlist('git rev-parse --show-toplevel')[0]
"     let b:flow = b:git_toplevel . '/node_modules/.bin/flow'
"     if executable(b:flow)
"       call add(b:neomake_javascript_enabled_makers, 'flow')
"       let b:neomake_javascript_eslint_exe = b:flow
"     endif
"     let b:flow_is_setup = 1
"   endif
" endfunction

"-------------------------------------------------------------------------------
" NEOMAKE - stylelint
"-------------------------------------------------------------------------------
" let g:neomake_css_enabled_makers = ['stylelint']
" let g:neomake_scss_enabled_makers = ['stylelint']
" let g:my_neomake_stylelint = {
"   \ 'args': [
"     \ '--config', '$XDG_CONFIG_HOME/stylelint/stylelint.config.js'
"   \ ],
"   \ 'errorformat': '%+P%f, %W%l:%c%*\s%m, %-Q'
"   \ }
" let g:neomake_css_stylelint_maker = g:my_neomake_stylelint
" let g:neomake_scss_stylelint_maker = g:my_neomake_stylelint

"-------------------------------------------------------------------------------
" NEOMAKE - python
"-------------------------------------------------------------------------------
" let g:neomake_python_pylint_maker = {
"   \ 'args': [ '--disable=no-absolute-import' ]
"   \ }
" let g:neomake_python_enabled_makers = ['pylint', 'flake8']

"-------------------------------------------------------------------------------
" ALE
"-------------------------------------------------------------------------------
let g:ale_fix_on_save = 1

"-------------------------------------------------------------------------------
" VIM-JSX
"-------------------------------------------------------------------------------
let g:jsx_ext_required = 0

"-------------------------------------------------------------------------------
" VIM-PRETTIER
"-------------------------------------------------------------------------------
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#trailing_comma = 'es5'
let g:prettier#config#jsx_brackets = 'false'

" function! SetupPrettier()
"   if !exists("b:prettier_is_setup")
"     let b:git_toplevel = systemlist('git rev-parse --show-toplevel')[0]
"     let b:prettier = b:git_toplevel . '/node_modules/.bin/prettier'
"     if executable(b:prettier)
"       let g:prettier#exec_cmd_path = b:prettier
"     else
"       echomsg "prettier bin not found"
"     endif
"     let b:prettier_is_setup = 1
"   endif
" endfunction

"-------------------------------------------------------------------------------
" VIAL
"-------------------------------------------------------------------------------
set hidden

"-------------------------------------------------------------------------------
" AUTOCOMMANDS
"-------------------------------------------------------------------------------
if !exists("g:loaded_gold")
  let g:loaded_gold = 1

  " establish local eslint and prettier for a js/jsx file
  " au BufRead,BufNewFile *.js :call SetupESLint()
  " au BufRead,BufNewFile *.js :call SetupFlow()
  " au BufRead,BufNewFile *.{jsx,js} :call SetupPrettier()

  " automatically format certain filetypes on write
  au BufWritePre *.{json,jsx,js,md} PrettierAsync

  " call neomake on :w
  " au BufWritePost * Neomake

  " don't automatically continue comments on newline
  au BufNewFile,BufRead * setlocal formatoptions-=cro

  " activate rainbow_parenthesis.vim
  " au BufNewFile,BufRead * RainbowParentheses

  " improve postcss syntax highlighting by using scss ft
  au BufRead,BufNewFile *.css set ft=scss

endif

"-------------------------------------------------------------------------------
" SEARCH
"-------------------------------------------------------------------------------
set ignorecase
set smartcase

if executable('ag')
  set grepprg=ag\ --vimgrep
endif

"-------------------------------------------------------------------------------
" CURSOR
"-------------------------------------------------------------------------------
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
let &t_SI .= "\<Esc>[3 q"

"-------------------------------------------------------------------------------
" COLORS
"-------------------------------------------------------------------------------
set termguicolors

syntax on
set background=dark
" color base16-embers
color base16-atelier-dune

" let g:rainbow#pairs = [['(', ')'], ['{', '}'], ['[', ']']]
" let g:rainbow#blacklist= [14, 7]

set list
set listchars=tab:>-,trail:_

highlight SpecialKey guifg=red
highlight Normal guibg=#000

"-------------------------------------------------------------------------------
" LANGUAGE SERVER
"-------------------------------------------------------------------------------
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['/usr/local/bin/javascript-typescript-languageserver'],
  \ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

"-------------------------------------------------------------------------------
" OTHER
"-------------------------------------------------------------------------------
" search recursively upwards for tags file
set tags=./.tags;/
