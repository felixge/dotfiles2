" ========== GENERAL ==========
" enable pathogen plugin manager
execute pathogen#infect()
" set leader key
let mapleader = ","
" make vim behave like vim, not vi
set nocompatible
" recognize file types and set indent mode accordingly
filetype plugin indent on
" use system clipboard
set clipboard+=unnamed
" make backspace work normally in insert mode
set backspace=indent,eol,start
" remember undo chains between sessions
set undofile
" do not create swap files
set nobackup
set nowritebackup
set noswapfile
" allow mouse usage in terminal vim
set mouse=a
" and make sure mouse scrolling actually works
" https://stackoverflow.com/questions/32103591/vim-cant-scroll-in-iterm2
if has("mouse_sgr")
  set ttymouse=sgr
else
  set ttymouse=xterm2
end
" use bash because plugins expect it
set shell=bash
" enable status line
set laststatus=2
" indention
set autoindent
" focus on bottom split when splitting vertically
set splitbelow
" disable folding
set nofoldenable
" automatically safe files when switchin between them / leaving vim
set autowriteall
autocmd FocusLost * silent! :wa
autocmd TabLeave * silent! :wa
" per project vimrc
set exrc
" better wrapping with indention
set breakindent
set showbreak=⌙

" ========= STYLE =========
" enable syntax highlighting
syntax on
" use solarized
colorscheme summerfruit256
" tell theme we're using a light background
set background=light
" highlight active line
set cursorline
hi CursorLine cterm=none
" visual line marking 80 characters (vim 7.3)
set colorcolumn=80
" show Line numbers
set number
" highlight search results
set hlsearch

" ========== KEY BINDINGS ==========
" clear search results when hitting space
nmap <silent> <Space> :nohlsearch<Bar>:echo<CR>
" copy path to current buffer into clipboard
nmap <leader><space> :!echo -n % \| pbcopy<CR><CR>
" open ctrlp
nmap <Leader>p :CtrlPMRU<CR>
" show go decls (uses ctrpl)
au FileType go nmap <Leader>d :GoDeclsDir<CR>
" show godoc
au FileType go nmap <Leader>h <Plug>(go-doc)
" alternate between test and source file
au FileType go nmap <Leader>a :GoAlternate<CR>
" highlight same identifiers
au FileType go nmap <Leader>s :GoSameIdsAutoToggle<CR>
" python goto definition
au FileType python nmap gd :YcmCompleter GoTo<CR>
" c goto definition
au FileType c nmap gd :YcmCompleter GoTo<CR>
nmap <Leader>e :ll<CR>
" toggle nerd tree
nnoremap <Leader>n :NERDTreeToggle<CR>
" reveal current file in nerdtree
nnoremap <Leader>f :NERDTreeFind<CR>
" edit ~/.vimrc
nmap <Leader>v :e ~/.vimrc<CR>
" jump to current location list entry (errror)
nmap <Leader>e :ll<CR>
" alt+t
nmap † :tabnew<CR>
" alt+w
nmap ∑ :tabclose<CR>
" alt+[
nmap “ :tabprev<CR>
" alt+]
nmap ‘ :tabnext<CR>
" alt+shift+[
nmap ’ :+tabmove<CR>
" alt+shift+]
nmap ” :-tabmove<CR>

" ========= TABS VS SPACES =========
set expandtab
" 2 spaces for each tab
set tabstop=2
" 2 spaces for indention
set shiftwidth=2
" shows tabs vs spaces
set list
au BufEnter * set listchars=tab:▸\ ,eol:¬

" ========== VIM-GO PLUGIN ==========
let g:go_fmt_command = "goimports"
au BufEnter *.go silent exe "GoGuruScope " . go#package#ImportPath(expand('%:p:h')) . "..."

" ========= SYNTASTIC PLUGIN ======
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_go_go_build_args="-o /tmp"
let g:syntastic_check_on_wq = 0
let g:syntastic_go_checkers= ["go"]
let g:syntastic_python_checkers = ["python"]

" ========= NERDTREE PLUGIN ======
" close NERDtree when selecting a file
let NERDTreeQuitOnOpen=1

" ========= SNIPMATE PLUGIN ======
" configure snipmate dir
let g:snippets_dir="~/.vim/snippets"


" ========= CTRLP PLUGIN ======
" don't modify the current working directory
let g:ctrlp_working_path_mode = ''
" only show most recently used files relative to current working directory
let g:ctrlp_mruf_relative = 1


" ========= VITALITY PLUGIN ======
" don't screw with my cursor
let g:vitality_fix_cursor = 0

" ========= AIRLINE PLUGIN ======
let g:airline_theme='light'
let g:airline_powerline_fonts = 1

" ========= ACK PLUGIN ======
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif


" ======== YOU COMPLETE ME PLUGIN ======
let g:ycm_python_binary_path='python3'
let g:ycm_key_list_select_completion = [''] " <TAB> causes snipmate to fail
let g:ycm_confirm_extra_conf=0
