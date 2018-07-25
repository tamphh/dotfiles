set nocompatible
filetype off

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Automatically install missing plugins on startup
if !empty(filter(copy(g:plugs), '!isdirectory(v:val.dir)'))
  autocmd VimEnter * PlugInstall | q
endif

" Make sure you use single quotes

"Plug 'rking/ag.vim'
"Plug 'wycats/nerdtree'
Plug 'scrooloose/nerdtree'
" Plug 'tpope/vim-vinegar'
"Plug 'yggdroot/leaderf'
Plug 'tpope/vim-fugitive'
"Plug 'jreybert/vimagit'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
" Plug 'wincent/scalpel'
" Plug 'wincent/loupe'
Plug 'lifepillar/vim-solarized8'
"Plug 'bling/vim-airline'
Plug 'itchyny/lightline.vim'
" Plug 'scrooloose/syntastic'
Plug 'thoughtbot/vim-rspec'
Plug 'ngmy/vim-rubocop'
Plug 'vim-ruby/vim-ruby'
Plug 'casecommons/vim-rails'
Plug 'pangloss/vim-javascript'
Plug 'maksimr/vim-jsbeautify'
Plug 'mgechev/vim-jsx'
Plug 'chriseppstein/vim-haml'
Plug 'hiukkanen/vim-hamlc'
Plug 'tpope/vim-cucumber'
Plug 'ludovicchabant/vim-gutentags'
Plug 'neomake/neomake'
" Plug 'henrik/vim-indexed-search'
Plug 'google/vim-searchindex'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim'
else
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Initialize plugin system
call plug#end()

syntax on                         " show syntax highlighting
filetype plugin indent on

" set number                         " show line number
set nobackup
set noswapfile
"set nowrap
set expandtab                      " use spaces, not tab characters
set showmatch                      " show bracket matches
set incsearch                      " show search results as I type
set autoindent                     " set auto indent
set tabstop=2                      " set indent to 2 spaces
set shiftwidth=2
set list listchars=tab:»·,trail:·,extends:>,precedes:<  " show extra space characters
set backspace=2 " make backspace work like most other programs
"set colorcolumn=120
"set laststatus=2                   " always show status bar
"set scrolloff=2                    " minimum lines above/below cursor
"set ttimeoutlen=100                " decrease timeout for faster insert with 'O'
set autoread                       " auto reload file
set hlsearch                       " highlight all search matches
"set hls
"set cursorline                     " highlight current line
"set smartcase                      " pay attention to case when caps are used
"set relativenumber                 " show relative line numbers
"set ignorecase                     " ignore case in search
"set vb                             " enable visual bell (disable audio bell)
"set ruler                          " show row and column in footer
"set nofoldenable                   " disable code folding
"set wildmenu                       " enable bash style tab completion
"set wildmode=list:longest,full
"set tags=./tags; " Set tags directory
set clipboard+=unnamed
set timeoutlen=1000 ttimeoutlen=10
set nomodeline                      " disable mode lines (security measure)
set splitbelow
set splitright

packadd! matchit
" Remap leader key to SPACE
let mapleader="\<SPACE>"

" unbind defaut mappings
map s <Nop>
map K <Nop>

" =====================================================================
" NERDTree
" =====================================================================
nnoremap <leader>pt :NERDTreeToggle<CR>
nnoremap <leader>ft :NERDTreeFind<CR>
let NERDTreeShowHidden         = 1
let NERDTreeShowFiles          = 1
let NERDTreeIgnore = [ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$', '\.o$',
      \ '\.so$', '\.egg$', '^\.git$', '^\.hg$', '^\.svn$', '^\.DS_Store',
      \ '\.png$', '\.jpg$', '\.jpeg$', '\.bmp$', '\.svg$', '\.gif$',
      \ '\.zip$', '\.gz$', '\.lock$', '\.swp$', '\.bak$', '\~$' ]

" Like vim-vinegar.
" Ref: https://www.youtube.com/watch?v=OgQW07saWb0&index=3&list=PLwJS-G75vM7kFO-yUkyNphxSIdbi_1NKX
let g:NerdLastFile = ''
nnoremap <silent> <Leader>fd :let g:NerdLastFile=expand("%:t") <bar> :silent edit <C-R>=empty(expand('%')) ? '.' : expand('%:p:h')<CR><CR>
" nnoremap <leader>nf :call search(g:NerdLastFile)<CR>
" Key f to do this only available in nerdtree
" search pattern partly
autocmd FileType nerdtree nnoremap <buffer> F :call search(g:NerdLastFile, 'w')<CR>
" search pattern exaclty
autocmd FileType nerdtree nnoremap <buffer> f :call
  \ search('\<' .g:NerdLastFile . '\>') <bar> :echo g:NerdLastFile<CR>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#skip_chars = ['(', ')', ' ']

" save buffer
nnoremap <leader>fs :w<CR>
nnoremap <leader>ps :wa <bar> :echo "written all"<CR>

" quit all buffers
nnoremap <leader>pq :qa<CR>
" quit current buffer
nnoremap <leader>q :q<CR>
" quit all buffers but current one
nnoremap <leader>O :only<CR>

" method definition related things
nnoremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <C-[> :sp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap gd :exec("tag ".expand("<cword>"))<CR>

" find and replace in a buffer
nnoremap c* *Ncgn

"Linting with neomake
" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
" call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
" call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
" call neomake#configure#automake('nrwi', 500)

" You can configure Neomake to open the list automatically:
let g:neomake_open_list = 2

" lifepillar/vim-solarized8
set background=dark
colorscheme solarized8
set fillchars=vert:│
hi VertSplit ctermbg=NONE guibg=NONE ctermfg=Green guifg=#839289
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" rubocop
let g:vimrubocop_config = '~/github/tp-web/.rubocop.yml'

" rspec-cucumber.vim mappings
nnoremap <Leader>T :call RunCurrentSpecFile()<CR>
nnoremap <Leader>t :call RunNearestSpec()<CR>
nnoremap <Leader>r :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
" Change in plugin code instead :))
"let g:rspec_command = "!rspec --color {spec}"

"windows
nnoremap <Leader>w/ :vsplit<CR>
nnoremap <Leader>w- :split<CR>
nnoremap <Leader>wr <C-w>r<CR>

nnoremap <Leader><Leader> :e#<CR>

" buffers mappings
nnoremap <Leader>b :buffers<CR>
nnoremap <Leader>1 :b 1<CR>
nnoremap <Leader>2 :b 2<CR>
nnoremap <Leader>3 :b 3<CR>
nnoremap <Leader>4 :b 4<CR>
nnoremap <Leader>5 :b 5<CR>

" keep selection after in/outdent
vnoremap < <gv
vnoremap > >gv

" easy split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" easy navigation insert mode
imap <C-h> <Left>
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-l> <Right>

" easy Ag
"nnoremap <leader>a :Ag ""<Left>
"nnoremap gA :Ag! <cword><CR>
set wildignore+=*.o,*.obj,.git,.pdf,tmp/,node_modules/
let g:agprg='ag -S --nocolor --nogroup --column --ignore node_modules --ignore "*.min.js"'

" code folding
"set foldmethod=syntax

" Esc mapping
" inoremap fd <esc>

"clear highlight search
" map <Leader>h :set hlsearch!<CR>
map <Leader>sc :noh<CR>
"nnoremap <Esc> :noh<CR><Esc>

" airline
"let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#fnamemod = ':t'
"let g:airline#extensions#branch#enabled = 0

" lightline
let g:lightline = {
  \   'colorscheme': 'powerline',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'readonly', 'filename', 'modified' ]
  \     ],
  \     'right': [ [ 'lineinfo' ],
  \            [ 'percent' ],
  \            [ 'filetype' ] 
  \     ]
  \   },
  \   'inactive': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
  \   'component': {
  \     'lineinfo': ' %3l:%-2v',
  \   },
  \   'component_function': {
  \     'gitbranch': 'fugitive#head',
  \   }
  \ }
let g:lightline.separator = {
  \   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
  \   'left': '', 'right': '' 
  \}
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
"set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline
set laststatus=2
set noshowmode

" rking/ag.vim
"let g:ag_prg='ag --vimgrep -S --path-to-ignore ~/.ignore'

" themes style
" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Changing cursor shape per mode
" 1 or 0 -> blinking block
" 2 -> solid block
" 3 -> blinking underscore
" 4 -> solid underscore
" 5 -> blink vertical line
" 6 -> steady vertical line
if exists('$TMUX')
    " tmux will only forward escape sequences to the terminal if surrounded by a DCS sequence
    let &t_SI .= "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
    let &t_EI .= "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
    autocmd VimLeave * silent !echo -ne "\033Ptmux;\033\033[0 q\033\\"
else
    let &t_SI .= "\<Esc>[6 q"
    let &t_EI .= "\<Esc>[2 q"
    autocmd VimLeave * silent !echo -ne "\033[0 q"
endif

" cursor line
"set cursorline
"autocmd InsertEnter * highlight CursorLine guifg=white guibg=blue ctermfg=white ctermbg=blue
"autocmd InsertLeave * highlight CursorLine guifg=white guibg=darkblue ctermfg=white ctermbg=darkblue

"set guicursor=i:ver25-iCursor

" copy current file name (relative/absolute) to system clipboard
if has("mac") || has("gui_macvim") || has("gui_mac")
  " relative path  (src/foo.txt)
  nnoremap <leader>cf :let @*=expand("%") <bar> :echo "relative path copied"<CR>

  " absolute path  (/something/src/foo.txt)
  nnoremap <leader>cF :let @*=expand("%:p") <bar> :echo "absolute path copied"<CR>

  " filename       (foo.txt)
  nnoremap <leader>ct :let @*=expand("%:t") <bar> :echo "filename copied"<CR>

  " directory name (/something/src)
  nnoremap <leader>ch :let @*=expand("%:p:h") <bar> :echo "directory name copied"<CR>
endif

" copy current file name (relative/absolute) to system clipboard (Linux version)
" if has("gui_gtk") || has("gui_gtk2") || has("gui_gnome") || has("unix")
"   " relative path (src/foo.txt)
"   nnoremap <leader>cf :let @+=expand("%")<CR>

"   " absolute path (/something/src/foo.txt)
"   nnoremap <leader>cF :let @+=expand("%:p")<CR>

"   " filename (foo.txt)
"   nnoremap <leader>ct :let @+=expand("%:t")<CR>

"   " directory name (/something/src)
"   nnoremap <leader>ch :let @+=expand("%:p:h")<CR>
" endif

" git
set diffopt=vertical

" pathogen
" execute pathogen#infect()

" arrow keys to resize panes
nnoremap <Leader><left> :vertical resize -2<CR>
nnoremap <Leader><right> :vertical resize +2<CR>
nnoremap <Leader><up> :resize -2<CR>
nnoremap <Leader><down> :resize +2<CR>

" simple complete
"set complete-=t
set complete-=i
set pumheight=12 						" Limit popup menu height
set completeopt-=longest
" set completeopt+=menuone
" set completeopt-=menu
" if &completeopt !~# 'noinsert\|noselect'
"   set completeopt+=noselect
" endif

" denite
" Denite custom highlights
call denite#custom#option('_', 'highlight_matched_range', 'None')
call denite#custom#option('_', 'highlight_matched_char', 'Function')
" use ag for file & content search
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts',
    \ ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
call denite#custom#var('file_rec', 'command',
  \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" ignores files
call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
  \ [ '.git/', '.ropeproject/', '__pycache__/',
  \ 'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])

"call denite#custom#option('default', 'auto_resume', 1)
nnoremap <Leader>oo :Denite outline<CR>
nnoremap <Leader>pf :Denite file_rec<CR>
nnoremap <Leader>rr :Denite -resume<CR>
nnoremap <Leader>/ :Denite grep<CR>
nnoremap <Leader>ss :Denite line<CR>
nnoremap <Leader>bb :Denite buffer<CR>
"grep with word under cursor
nnoremap <Leader>? :Denite grep:::`expand('<cword>')`<CR>
call denite#custom#map('insert','<C-j>','<denite:move_to_next_line>','noremap')
call denite#custom#map('insert','<C-k>','<denite:move_to_previous_line>','noremap')

"narrow by path in grep source.
call denite#custom#source('grep',
  \ 'converters', ['converter/abbr_word'])

" tabopen & split
call denite#custom#map('insert', '<C-t>', '<denite:do_action:tabopen>')
call denite#custom#map('insert', '<C-v>', '<denite:do_action:vsplit>')
call denite#custom#map('insert', '<C-h>', '<denite:do_action:split>')
