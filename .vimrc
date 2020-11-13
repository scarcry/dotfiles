" Settings{{{
set nocompatible                  " Must come first because it changes other options.
syntax enable                     " Turn on syntax highlighting.
syntax on
filetype plugin on                " Turn on file type detection.
filetype indent plugin on         " Turn on file type detection.
let mapleader = ","
set number
set relativenumber
set expandtab                     " converts tab to spaces as whitespace
set path+=**                      " search directories upwards and downwards
set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.
set backspace=indent,eol,start    " Intuitive backspacing.
set hidden                        " Handle multiple buffers better.
set wildmenu                      " Enhanced command line completion.
"set wildmode=list:longest         " Complete files like a shell.
set incsearch                     " Highlight matches as you type.
set smartcase                     " automatically switch to case-sensitive when using uppercase
set ignorecase
set cursorline
set hlsearch                      " Highlight matches.
set wrap                          " Turn on line wrapping.
set modeline                      " Allow per file config
" set tabstop=2
set autoindent
set smartindent
set bg=dark

" to paste without having to disable ai (autoindent) and to avoid having to permanently set 'set paste' use: :r !cat [shift-insert copy buffer] , end with ctrl-d

" this should enable some yaml syntax highlighting
" autocmd Filetype yaml setlocal tabstop=2 ai colorcolumn=1,3,5,7,9,80

" enable yaml syntax color
au BufNewFile,BufRead *.yaml,*.yml so ~/.vim/yaml.vim

"statusline setup
set laststatus=2
set statusline=%<%f\ %h%m%r\ %y%=%{v:register}\ %-14.(%l,%c%V%)\ %P
set statusline=%t       "tail of the filename
set statusline+=[%{strlen(&fenc)?&fenc:'none'}, "file encoding
set statusline+=%{&ff}] "file format
set statusline+=%h      "help file flag
set statusline+=%m      "modified flag
set statusline+=%r      "read only flag
set statusline+=%F      "full filename
set statusline+=%y      "filetype
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file}}}}}}
"
" normal maps{{{

" change pwd to directory of current file
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>
nnoremap <space>r :set relativenumber!<CR>
nnoremap <space>n :set number!<CR>
"
" folding: met shift-tab in- en uitklappen
nnoremap <silent> <s-tab> :exe 'silent! normal! za'.(foldlevel('.')?'':'l')<cr>
if has("folding") == 1
        set foldmethod=marker
        let fortran_fold = 1
        let php_folding = 1
        let perl_fold = 1
        let rcs_folding = 1
        let ruby_fold = 1
        let sh_fold_enabled = 1
endif
" =====================================
"}}}

" Automatically save folds{{{
augroup remember_folds
  autocmd!
  autocmd BufWinLeave * silent! mkview
  autocmd BufWinEnter * silent! loadview
augroup END"}}}


" =====================================
" DNS serial increment script, use '6 shift-g = u' key combo to raise serial
" quickly and safely
map =u :call SerialUp()<cr>
function! SerialUp()
        let lstr = getline(".")
        let serial = matchstr(lstr, '[0-9]\{10\}')
        let newserial = strftime("%Y%m%d") . "00"
        while ( newserial <= serial )
                let newserial = newserial + 1
        endwhile
        exe 's#[0-9]\{10\}#'.newserial."#"
endfunction
