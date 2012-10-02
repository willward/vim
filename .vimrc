" This must be first, because it changes other options as side effect
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set statusline=[%n]\ %0.30t%m%h%w\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" change the mapleader from \ to ,
let mapleader=","

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

set hidden

set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set expandtab
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type


set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore+=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep

set nobackup
set noswapfile

set wildmenu

set number
set numberwidth=5
map <F10> :set invnumber<CR>

filetype plugin indent on

colorscheme evening
syntax on

set pastetoggle=<F3>

"set mouse=a

set cursorline
hi CursorLine cterm=NONE ctermbg=DarkBlue  guibg=DarkBlue

nnoremap <F11> :call ToggleMouse()<CR>

fun! ToggleMouse()
    if !exists("s:old_mouse")
        let s:old_mouse = "a"
    endif

    if &mouse == ""
        let &mouse = s:old_mouse
        echo "Mouse is for Vim (" . &mouse . ")"
    else
        let s:old_mouse = &mouse
        let &mouse=""
        echo "Mouse is for terminal"
    endif
endfunction


inoremap jj <ESC>

au BufNewFile,BufRead SCons* set filetype=python

" -- ctags --
" map F12 to generate ctags for current folder:
map <F12> :!ctags -R -V --c++-kinds=+p --fields=+iaS --extra=+q --exclude=dependencies --exclude=out --exclude=external --exclude=docs .<CR><CR>
set tags=tags


nnoremap ; :

nnoremap j gj
nnoremap k gk

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

nmap <C-up> <C-w>k
nmap <C-down> <C-w>j
nmap <C-left> <C-w>h
nmap <C-right> <C-w>l

nmap <silent> <leader>/ :nohlsearch<CR>

" plugins
" 
" CTRL-P
let g:ctrlp_custom_ignore = 'dependencies\|out\|external\|docs\|.svn\|*.tmp\|*.svn'
let g:ctrlp_working_path_mode = 0


" A.vim
map <leader>a :A<CR>

" OmniCppComplete

let g:SuperTabDefaultCompletionType = "context"

highlight   Pmenu         ctermfg=0 ctermbg=2
highlight   PmenuSel      ctermfg=0 ctermbg=7
highlight   PmenuSbar     ctermfg=7 ctermbg=0
highlight   PmenuThumb    ctermfg=0 ctermbg=7

" automatically open and close the popup menu / preview window 
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

let OmniCpp_MayCompleteScope = 1 

" Nerdtree
map <F2> :NERDTreeToggle<CR>
let NERDTreeDirArrows=0
let NERDTreeMouseMode=1

map <F5> :execute "vimgrep /" . expand("<cword>") . "/j **/*.cpp" <Bar> cw<CR>


map <F9> :TlistToggle<CR>

let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1

set makeprg=/cygdrive/c/Python27/Scripts/scons.bat

" filename(line) : error|warning|fatal error C0000: message
set errorformat=\ %#%f(%l)\ :\ %#%t%[A-z]%#\ %[A-Z\ ]%#%n:\ %m,%f(%l):\ %#%t%[A-z]%#:\ %m


