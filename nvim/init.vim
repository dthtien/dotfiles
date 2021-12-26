call plug#begin()
" init setup
Plug 'tpope/vim-sensible'
" Some Git stuff
Plug 'tpope/vim-fugitive'
" Language support things
Plug 'othree/html5.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'ap/vim-css-color'
" LSP support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'mxw/vim-jsx'
" Fancy UI stuff
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'itchyny/lightline.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Moving around easier
Plug 'easymotion/vim-easymotion'
" Improving editing experience
Plug 'hrsh7th/nvim-compe'
Plug 'vim-scripts/matchit.zip'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'haya14busa/incsearch.vim'
Plug 'tpope/vim-abolish' " For case perserved subtitue :%S
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'liuchengxu/vim-which-key'
Plug 'tpope/vim-projectionist'
Plug 'Yggdroot/indentLine'
Plug 'Galooshi/vim-import-js'
Plug 'github/copilot.vim', { 'branch': 'release' }
Plug 'iamcco/markdown-preview.nvim'
Plug 'sbdchd/neoformat'
call plug#end()

lua require("lsp_config")
lua require("complete")
lua require("tree-sitter")
lua require("nvim_tree")

highlight link CompeDocumentation NormalFloat

filetype plugin indent on

" Auto remove trailing spaces
autocmd BufWritePre * %s/\s\+$//e

set encoding=UTF-8
set hidden
set nobackup
set nowritebackup
set mouse=a " enable mouse for all mode
set wildoptions=pum
set pumblend=20
set cursorline
set colorcolumn=80
set number relativenumber
set wrap

set foldmethod=indent
set foldlevel=99

let g:is_posix = 1
let g:indentLine_char = '▏'
let g:indentLine_color_gui = '#302f2f'

set noswapfile
set nojoinspaces
set nowrap
set ttyfast
set laststatus=2
set ttimeout
set ttimeoutlen=10
set termguicolors
set ignorecase
let g:loaded_ruby_provider = 0
set background=dark
set textwidth=120
colorscheme nightfly

if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
	syntax on
endif

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set nolist

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set tabstop=2
set softtabstop=2
set shiftwidth=2
set shiftround
set expandtab

set autoindent
set smartindent

" Persistent undo
" Don't forget mkdir folder $HOME/.vim/undo
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

let g:NERDSpaceDelims = 1
map mm <Plug>NERDCommenterToggle

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" Key binding
" I don't use recording, don't judge me
map q <Nop>
inoremap jk <ESC>
vnoremap <M-/> <Esc>/\%V
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <ESC><ESC> :nohlsearch<CR>

" Duplicate everything selected
vmap D y'>p

" Map Emacs like movement in Insert mode
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-f> <Right>
inoremap <C-b> <Left>
inoremap <C-e> <C-o>$
inoremap <C-w> <C-o>^

" Remap scrolling
nnoremap <C-k> <C-u>
nnoremap <C-j> <C-d>
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Copy faster
nnoremap Y y$

let mapleader=" "
nnoremap <Leader>w :w<CR>
nnoremap <Leader>l :vsplit<CR>
nnoremap <Leader>k :split<CR>
nnoremap <Leader>wh :wincmd h<CR>
nnoremap <Leader>wl :wincmd l<CR>
nnoremap <Leader>wk :wincmd k<CR>
nnoremap <Leader>wj :wincmd j<CR>
nnoremap <Leader>w= :wincmd =<CR>
nnoremap <Leader>wb :e#<CR>
nnoremap <Leader>qq :bd<CR>
nnoremap <Leader>x :x<CR>
nnoremap <Leader>qk :call DeleteCurrentFileAndBuffer()<CR>
nnoremap <Leader>ss :mksession! .work<CR>
nnoremap <Leader>sr :so .work<CR>
nnoremap <Leader><Leader>r :so ~/.config/nvim/init.vim<CR>
nnoremap <Leader>n :NvimTreeToggle<CR>
nnoremap <Leader>f :NvimTreeFindFile<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
"Buffer
nnoremap <Leader>tn :tabn<CR>
nnoremap <Leader>tp :tabp<CR>
nnoremap <Leader>tc :tabe<CR>
nnoremap <Leader>tx :tabclose<CR>
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" RSpec.vim setting
function! CallRspecWithCurrentFile()
  let fileType = &filetype
  if fileType == 'ruby'
    let scommand = 'bundle exec rspec ' . expand("%")
    execute '!'.scommand
  elseif fileType == 'go'
    let scommand = 'go test -v'
    execute '!'.scommand
  else
    echo 'File ' . fileType . ' not support!'
  endif
endfunction

function! CallRspecWithTag()
  let fileType = &filetype
  let rtag = input('Input tag: ')

  if fileType == 'ruby'
    let scommand = 'bundle exec rspec --tag=' . rtag
    call inputrestore()
    execute '!'.scommand
  elseif fileType == 'go'
    let scommand = 'go test -run ' . rtag
    call inputrestore()
    execute '!'.scommand
  else
    call inputrestore()
    echo 'File ' . fileType . ' not support!'
  end
endfunction

map <Leader>rt :call CallRspecWithCurrentFile()<CR>
map <Leader>rwt :call CallRspecWithTag()<CR>
" Go
function! ExecuteGoCurrentFile()
  let scommand = 'go run ' . expand("%")
  execute '!'.scommand
endfunction

nnoremap <leader>E :call ExecuteGoCurrentFile()<CR>

map <Leader>gd :Git diff<CR>
map <Leader>gw :Gwrite<CR>
map <Leader>gds :Gdiffsplit<CR>
map <Leader>gbl :Git blame<CR>
map <Leader>gr :Gread<CR>
map <Leader>gs :Gstatus<CR>
" File path
map <Leader>fp :let @+ = expand("%")<CR>

" Turn off whitespaces compare and folding in vimdiff
set splitright
silent! set splitvertical
set diffopt+=iwhite
set diffopt+=vertical
nnoremap <Leader>1 :diffget 1<CR>:diffupdate<CR>
nnoremap <Leader>2 :diffget 2<CR>:diffupdate<CR>

set clipboard=unnamed

function! DeleteCurrentFileAndBuffer()
  call delete(expand('%'))
  bdelete!
endfunction

function! DrawGitBranchInfo()
  let branch = fugitive#head()
  return len(branch) > 0 ? " " . branch : ""
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

function! LightLineFilename()
  let name = ""
  let subs = split(expand('%'), "/")
  let i = 1
  for s in subs
    let parent = name
    if  i == len(subs)
      let name = len(parent) > 0 ? parent . '/' . s : s
    elseif i == 1
      let name = s
    else
      let part = strpart(s, 0, 10)
      let name = len(parent) > 0 ? parent . '/' . part : part
    endif
    let i += 1
  endfor
  return name
endfunction

let g:lightline = {
      \ 'colorscheme': 'darcula',
      \ 'active': {
      \   'left': [ ['fileicon'], [ 'filename' ] ],
      \   'right': [ [ 'icongitbranch' ], [ 'lineinfo' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ [], ['fileicon'], [ 'filename' ] ],
      \   'right': []
      \ },
      \ 'component': { 'lineinfo': ' %2p%% %3l:%-2v' },
      \ 'component_function': {
      \   'fileicon': 'MyFiletype',
      \   'icongitbranch': 'DrawGitBranchInfo',
      \   'iconline': 'DrawLineInfo',
      \   'gitbranch': 'fugitive#head',
      \   'filename': 'LightLineFilename',
      \ },
      \ }


" Type q to quit on help file
autocmd FileType help nmap <buffer>q :q<CR>

set shortmess+=c
set signcolumn=yes

" Use K to show documentation in preview window
nnoremap <leader>H :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    execute 'lua vim.lsp.buf.hover()'
  endif
endfunction

" Use `:Fold` to fold current buffer
" Vim easymotion
nmap <silent> ;; <Plug>(easymotion-overwin-f)
nmap <silent> ;l <Plug>(easymotion-overwin-line)
nnoremap <silent> <Leader>s :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>sa :Ag<CR>
nnoremap <silent> <Leader>P  :FZF <C-R><C-W><CR>
nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>h :History<CR>
nnoremap <silent> <Leader>F :GFiles<CR>
nnoremap <silent> <Leader>m :Marks<CR>
nnoremap <silent> <Leader>a :A<CR>
nmap <Leader>S *:%s/\<<C-r><C-w>\>//g<Left><Left>

" Auto change root of the project
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_patterns = ['Cargo.tom', 'package.json', '.git/']

let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

" Some custom style
highlight Normal guibg=NONE
highlight EasyMotionTargetDefault guifg=#ffb400
highlight NonText guifg=#354751
highlight VertSplit guifg=#212C32
highlight WildMenu guibg=NONE guifg=#87bb7c
highlight CursorLineNr guibg=NONE

" fzf

let $FZF_DEFAULT_OPTS = '--layout=reverse --inline-info'
let $FZF_DEFAULT_COMMAND = "rg --files --hidden --glob '!.git/**' --glob '!build/**' --glob '!.dart_tool/**' --glob '!.idea' --glob '!node_modules'"
let g:fzf_layout = { 'down':  '40%' }
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }


let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ]
let g:nvim_tree_gitignore = 1
let g:nvim_tree_auto_ignore_ft = [ 'startify', 'dashboard' ]
let g:nvim_tree_quit_on_open = 0
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_git_hl = 1
let g:nvim_tree_highlight_opened_files = 1
let g:nvim_tree_root_folder_modifier = ':~'
let g:nvim_tree_add_trailing = 1
let g:nvim_tree_group_empty = 1
let g:nvim_tree_disable_window_picker = 1
let g:nvim_tree_icon_padding = ' '
let g:nvim_tree_symlink_arrow = ' >> '
let g:nvim_tree_respect_buf_cwd = 1
let g:nvim_tree_window_picker_exclude = {
    \   'filetype': [
    \     'packer',
    \     'qf'
    \   ],
    \   'buftype': [
    \     'terminal'
    \   ]
    \ }
let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 }
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ 'folder_arrows': 1,
    \ }
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   },
    \   'lsp': {
    \     'hint': "",
    \     'info': "",
    \     'warning': "",
    \     'error': "",
    \   }
    \ }

highlight NvimTreeFolderIcon guibg=blue

" MarkdownPreviewer

nmap <C-v> <Plug>MarkdownPreview
let g:neoformat_try_node_exe = 1
autocmd BufWritePre *.js Neoformat
