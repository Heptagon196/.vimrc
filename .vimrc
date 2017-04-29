set shell=/bin/fish
let g:VIM_HOME = expand('~/.vim')
if has('nvim')
	let g:VIM_HOME = expand('~/.config/nvim')
endif

let s:vim_plug_path = g:VIM_HOME.'/autoload/plug.vim'
if !filereadable(s:vim_plug_path)
	echo "Installing Vim-plug ..."
	echo ""
	let s:vim_plug_git = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
	execute "!curl -fLo ".s:vim_plug_path." --create-dirs ".s:vim_plug_git
endif
let s:vim_plugged_path = g:VIM_HOME.'/plugged'

call plug#begin('~/.vim/plugged')
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'fatih/vim-go'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/vim-cursorword'
Plug 'Valloric/YouCompleteMe',{'on': 'YcmCompleter'}
Plug 'terryma/vim-expand-region'
Plug 'haya14busa/incsearch.vim'
Plug 'kien/rainbow_parentheses.vim'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'spf13/vim-colors'
Plug 'mbbill/undotree'
Plug 'majutsushi/tagbar'
Plug 'tpope/vim-markdown'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'altercation/vim-colors-solarized'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'ryanoasis/vim-devicons'
call plug#end()

"let g:airline_powerline_fonts=1
let NERDTreeQuitOnOpen=1
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=20
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#show_tab_nr=0
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:tagbar_compact=1
let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarized_visibility="normal"
let g:tagbar_width=20
let g:undotree_SplitWidth=20
let g:indent_guides_enable_on_vim_startup=1
let g:AutoPairsMapCR=0
let g:airline#extensions#ycm#enable=1
let g:ycm_global_ycm_extra_conf='~/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf=0
let g:ycm_use_utilsnips_completer=1
let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_collect_identifiers_from_tags_files=1
let g:airline_section_b=''
let g:airline_section_warning=''
let g:python_host_skip_check=1
let g:python_host_prog = '/usr/bin/python2'
let g:python3_host_skip_check=1
let g:python3_host_prog = '/usr/bin/python'
let g:neocomplete#enable_at_startup = 1
let g:startify_session_dir = '~/.vim/session'
let g:startify_padding_left = 10
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree', 'startify']

set nrformats=
set ttimeoutlen=100
set backspace=indent,eol,start
set cindent
set wrap
set nospell
set cursorline
set nu
set nospell
set wildmenu
set laststatus=2
set undolevels=1000
set undoreload=10000
set undofile
set undodir=$HOME/.vimundo/
set expandtab
set smarttab
set shiftround
set tabstop=4
set shiftwidth=4
set incsearch
set completeopt-=preview
set go=
set guifont=Ubuntu\ Mono\ 14
set clipboard=unnamedplus
"set relativenumber
set scrolloff=3

syntax on
color solarized
set background=light
hi Normal ctermbg=white ctermfg=0

let mapleader=','
map <leader>e :NERDTreeTabsToggle<CR>
map <leader>t :TagbarToggle<CR>
map <leader>u :UndotreeToggle<CR>:UndotreeFocus<CR>
map <leader><tab> :bn<CR>
map <leader>s<tab> :bp<CR>
map <leader>x :bd<CR>
map <leader>j :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>q :wqa<CR>
noremap j gj
noremap k gk
noremap <Up> g<Up>
noremap <Down> g<Down>
noremap <Tab> <C-w><C-w>
imap <silent><CR> <CR><Plug>AutoPairsReturn
imap <C-z> <Esc>ui
imap <C-y> <Esc><C-r>i
imap <M-j> <C-o>gj
imap <M-k> <C-o>gk
imap <M-h> <C-o>h
imap <M-l> <C-o>l
map H ^
map L $
"map J <C-d>
"map K <C-u>
map gr :w<CR>:GoRun<CR>
map ge :w<CR>:GoBuild<CR>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)

if has('nvim')
	tnoremap <Esc> <C-\><C-n>
	map ,z :vsplit term://zsh<CR>i
	map ,f :vsplit term://fish<CR>i
	set inccommand=nosplit
endif

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

augroup load_us_ycm
  autocmd!
  autocmd VimEnter *.cpp,*.c,*.h,*.py,*.hs,*.go call plug#load('YouCompleteMe')
                     \| autocmd! load_us_ycm
augroup END
