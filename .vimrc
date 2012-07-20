set guifont=courier_new:h8
colorscheme desert

set statusline=[%n]\ %0.30t%m%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2
set ignorecase
set infercase
set smartcase
set mouse=n
map <F10> :set invnumber<CR>

syntax on
filetype on
filetype indent on
au BufNewFile,BufRead SCons* set filetype=python

set expandtab
set shiftwidth=3
set softtabstop=3
set backspace=indent,eol,start
set tags=tags
set notimeout
set nottimeout

highlight   Pmenu         ctermfg=0 ctermbg=2
highlight   PmenuSel      ctermfg=0 ctermbg=7
highlight   PmenuSbar     ctermfg=7 ctermbg=0
highlight   PmenuThumb    ctermfg=0 ctermbg=7

" Press F7 to toggle highlighting on/off, and show current value.
map <F8> :set hlsearch! hlsearch?<CR>
set hlsearch

set number
set numberwidth=5

set pastetoggle=<F3>
map <F2> :NERDTreeToggle<CR>
map ,a :A<CR>
map <F9> :TlistToggle<CR>

let Tlist_Exit_OnlyWindow = 1
let Tlist_Show_One_File = 1
let Tlist_Enable_Fold_Column = 0
let Tlist_Use_Right_Window = 1


" Fix Double ESC issue
let &t_ti.="\e[?7727h"
let &t_te.="\e[?7727l"
noremap <Esc>O[ <Esc>
noremap! <Esc>O[ <C-c>

" OmniCppComplete
filetype plugin on
set nocp

let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " show function parameters
let OmniCpp_MayCompleteDot = 0 " autocomplete after .
let OmniCpp_MayCompleteArrow = 0 " autocomplete after ->
let OmniCpp_MayCompleteScope = 0 " autocomplete after ::
let OmniCpp_DefaultNamespaces = ["std"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview

" -- ctags --
" map F12 to generate ctags for current folder:
map <F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+fq .<CR><CR>

nnoremap ,cd :cd %:p:h<CR>:pwd<CR>

set complete-=i
set path=**

nnoremap <F4> :buffers<CR>:buffer<Space>
map <F5> :execute "noautocmd vimgrep /" . expand("<cword>") . "/j **/*.cpp" <Bar> cw<CR>
map <F6> :VCSVimDiff<CR>
map <F7> :q<CR>:bn<CR>

nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

set wildmenu

