syntax on
filetype on
filetype plugin on
filetype indent on
set nu rnu
set nowrap
set showcmd
set mouse=a
set showmode
set nobackup
set wildmenu
set hlsearch
set incsearch
set expandtab
set smartcase
set showmatch
set tabstop=4
set cursorline
set splitright
set ignorecase
set belloff=all
set ts=4 sw=4 et
set laststatus=2
set shiftwidth=4
set scrolloff=10
set history=1000
set updatetime=300
set wildmode=list:longest
set list listchars=trail:-
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


augroup remember_folds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent! loadview
augroup END




nnoremap <leader>fg :call Fzfpath()<CR>
nnoremap <leader>ff :FZF<CR>

if (has("autocmd") && !has("gui_running"))
  augroup colors
    autocmd!
    let s:background = { "gui": "#000000", "cterm": "0", "cterm16": "0" }
    let s:column = {"gui" : "", "cterm" : "0"}
    let s:cursorline = {"gui" : "#100000", "cterm" : "0"}
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "bg": s:background }) "No `fg` setting
    autocmd ColorScheme * call onedark#set_highlight("ColorColumn", { "bg": s:background }) "No `fg` setting
    autocmd ColorScheme * call onedark#set_highlight("CursorLine", { "bg": s:cursorline }) "No `fg` setting
  augroup END
endif


let g:lightline = {"colorscheme" : "simpleblack"}

colorscheme onedark
