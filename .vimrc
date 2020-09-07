
call plug#begin()
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'joshdick/onedark.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'vim-airline/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'preservim/nerdtree'
Plug 'leafgarland/typescript-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()
set background=dark
colorscheme onedark

set number					                    "Line numbers
set relativenumber				              "Relative line numbers
set incsearch					                  "Highlight search while typing"
set wildmenu					                  "Display autocomplete menu for vim commands"
set scrolloff=5					                "Leave 5 lines of buffer when scrolling"
set sidescrolloff=10			              "Leave 10 characters of horizontal buffer when scrolling"
set textwidth=100				                "Make it obvious where 100 characters is"
set tabstop=2					                  "Indendation tabs for proper indentation"
set wildmode=longest,list,full			    "Enable autocompletion"
set shiftwidth=2				                "Enables next line auto indendation"
set expandtab					                  "Convert new tabs to spaces"
" set smartindent
set splitbelow splitright
set clipboard=unnamed                   "Use OS clipboard by default"
set ttyfast                             "Optimize for fast terminal connections"
set noswapfile                          "Do not generate a .swp file

syntax on
filetype on                             "Detects the type of file
filetype indent on                      " Enable filetype-specific indenting
filetype plugin on                      " Enable filetype-specific plugins

"Highlights relative line numbers
:highlight LineNr ctermfg=Grey

" :map = map recursively
" :noremap = map non-recursively
" : inoremap means map in insert mode only
" :nnoremap means map only in normal mode
" : autocmd is used to run commands for a specific file type
" :cnoreabbrev is to map alias/map commands to vim CLI
" :set is used to change value of internal vim variable
" :let is used to change configuration variables for plugins

" Remap leader key to space
noremap <SPACE> <Nop>
let mapleader=" "

" Set FZF window to center
"let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 }}


"Keybindings
"Shortcut split navigation with standard vim keys
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Map NERDTree to command-b similar VSCode Tree toggle
nmap <C-b> :NERDTreeToggle<CR>
" Remap save and exit
noremap <leader>w :w<CR>
noremap <leader>x :x<CR>
" FZF 
nnoremap <C-p> :GFiles<CR>
"General vim settings
imap jk <Esc>

"CoC configuration
"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate. 
" NOTE: use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into config
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Use tab and S-tab to navigate the completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

