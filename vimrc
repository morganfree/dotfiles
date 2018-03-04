" -- PRE  -------------------------------------------------------------------------------------------------------

set nocompatible                                    " make Vim behave in a more useful way

" load plugins
execute pathogen#infect()


" -- GENERAL  ---------------------------------------------------------------------------------------------------

set autoindent                                      " copy indent from current line when starting a new line
set autoread                                        " read the file again if it has been changed outside of vim
set backspace=indent,eol,start                      " allow backspace to delete indent, end and start of line
set backupdir=~/.vim/backup//                       " set the directory for backups
set colorcolumn=80                                  " set the screen column
set completeopt=longest,menuone                     " improve completion menu
set directory=~/.vim/swp//                          " set the directory for swaps
set encoding=utf-8 nobomb                           " set encoding
set expandtab                                       " use spaces instead of tabs
set hlsearch                                        " highlight matches
set ignorecase                                      " ignore case in searches
set incsearch                                       " highlight matches while typing
set laststatus=2                                    " always show a statusline
set lazyredraw                                      " prevent from unnecessary redraws
set list listchars=tab:\|-,trail:_                  " make whitespace characters visible
set matchpairs+=<:>                                 " '<' and '>' form a pair
set noerrorbells visualbell t_vb=                   " disable flash and bell on error
set nofoldenable                                    " open all folds
set nostartofline                                   " keep the cursor in the same line after navigating
set nowrap                                          " do not wrap lines
set nojoinspaces                                    " do not insert two spaces after a '.', ', ', '?', '!' with a join command
set number                                          " show the absolute number
set path=$PWD/**                                    " set path to the current directory and its all subdirectories
set relativenumber                                  " show the relative number
set scrolloff=3                                     " start scrolling # lines before a buffer horizontal borders
set shiftwidth=2                                    " number of spaces used in autoindent
set showcmd                                         " show incomplete commands in the last line of the screen
set smartcase                                       " disable ignorecase if uppercase letters are used
set splitright                                      " a new window is put on the right 
set splitbelow                                      " a new window is put below
set tabstop=2                                       " number of spaces for <tab>
set ttyfast                                         " send more characters to the screen for redrawing
set wildignore+=.DS_Store,*/node_modules/*          " ignore those files when expanding wildcards
set wildmenu                                        " enhance command-line completion

set runtimepath+=/usr/local/opt/fzf                 " add fuzzy finder directory to runtime path


" -- COLORS  ----------------------------------------------------------------------------------------------------

set t_Co=256                                        " enable 256 colors
set background=dark                                 " set background

syntax on                                           " turn on syntax highlighting
colorscheme jellybeans                              " set colorscheme

" hide tilde signs at the end of buffer
highlight EndOfBuffer ctermfg=black ctermbg=black

" no special color for listchars
hi SpecialKey ctermbg=none


" -- STATUS LINE  -----------------------------------------------------------------------------------------------

hi StatusLineNC ctermbg=black
hi StatusLine ctermbg=236
hi User1 ctermfg=cyan ctermbg=236
hi User2 ctermfg=yellow ctermbg=236
hi User3 ctermfg=green ctermbg=236
hi User4 ctermfg=red ctermbg=236

set statusline=%1*\ %n%2*\ %l/%L\ %v                " set the left of status line to: {line number/number of lines} {column number}
set statusline+=%=
set statusline+=%3*%f%4*%m                          " set the right of status line to: {relative path to file}{modified flag}


" -- KEY BINDINGS  ----------------------------------------------------------------------------------------------

let mapleader=","                                   " map the leader key
let maplocalleader="\\"                             " map the local leader key

nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>bi'<esc>lel
nnoremap <leader>` viw<esc>a`<esc>bi`<esc>lel

" search in a very magic mode
nnoremap / /\v
" replace in a very magic mode
cnoremap %s %s/\v

" navigate faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>
vnoremap <C-e> 3<C-e>
vnoremap <C-y> 3<C-y>

" clear search highlight
nnoremap <leader>n :noh<cr>

" indent the whole buffer and go back to the last position
nnoremap <leader>= gg=G``

" toggle case of the inner word
nnoremap <leader>~ g~iw

" insert a new line below the cursor
nnoremap <leader>o o<ESC>k 
" insert a new line above the cursor
nnoremap <leader>O O<ESC>j

" yank from the cursor to the end of line
nnoremap Y y$

" yank/paste to the system clipboard
nnoremap <leader>p "+p
nnoremap <leader>y "+y


" -- PLUGINS / FILETYPES  ---------------------------------------------------------------------------------------

filetype plugin indent on                           " turn on filetype plugin, indent and detection 


" -- netrw  -----------------------------------------------------------------------------------------------------

let g:netrw_alto=0
let g:netrw_banner=0                                " hide the banner
let g:netrw_liststyle=3                             " enable tree style listings
let g:netrw_preview=1                               " preview window shown in a vertically split window
let g:netrw_winsize=25                              " initial size of new netrw window

" settings for netrw buffers
let g:netrw_bufsettings='noma nomod nonu nobl nowrap ro rnu'

" toggle the local-directory browser in the left vertical split 
nnoremap <C-w>e :Lexplore<CR>


" -- ale  -------------------------------------------------------------------------------------------------------

" let g:ale_lint_on_enter=1                           " lint on opening a file
" let g:ale_lint_on_insert_leave=1                    " lint on insert leave
" let g:ale_lint_on_save=1                            " lint on file save
let g:ale_lint_on_text_changed='always'             " dont lint on text change
let g:ale_lint_delay=1000                           " delay linting after text is changed
let g:ale_sign_column_always=1                      " keep the sign column open

" set linters
let g:ale_linters={'javascript': ['standard', 'eslint', 'flow']}

" set fixers
let g:ale_fixers={'javascript': ['standard', 'eslint']}

" fix the code
nnoremap <leader>fi :ALEFix<CR>


" -- undotree  --------------------------------------------------------------------------------------------------

let g:undotree_HelpLine=0                           " hide help line
let g:undotree_WindowLayout=2                       " set the layout: the tree on the left, the diff below

" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>


" -- css  -------------------------------------------------------------------------------------------------------

augroup cssrc
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
augroup END


" -- html  ------------------------------------------------------------------------------------------------------

augroup htmlrc
  autocmd!
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
augroup END


" -- javascript  ------------------------------------------------------------------------------------------------

" vim-javascript
let g:javascript_plugin_flow=1                      " enable syntax highlighting for flow
let g:javascript_plugin_jsdoc=1                     " enable syntax highlighting for jsdoc

" vim-jsx
let g:jsx_ext_required = 0                          " enable jsx syntax highlighting for files with .js and .jsx extension

" tern for vim
let g:tern_map_keys=1                               " enable default key mappings

augroup javascriptrc
  autocmd!
  autocmd FileType javascript
        \ setlocal expandtab tabstop=2 shiftwidth=2 softtabstop=2 |
        \ setlocal omnifunc=javascriptcomplete#CompleteJS
augroup END


" -- python  ----------------------------------------------------------------------------------------------------

augroup pythonrc
  autocmd!
  autocmd FileType python
        \ setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 |
        \ setlocal omnifunc=pythoncomplete#Complete
augroup END


" -- AUTOCOMMANDS  ----------------------------------------------------------------------------------------------

augroup disableAutoCommenting
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
augroup END

augroup autoChangeDirectory
  autocmd!
  autocmd InsertEnter * let b:save_cwd = getcwd() | set autochdir
  autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(b:save_cwd)
augroup END

augroup setRelativeNumberOnActiveWindow
  autocmd!
  autocmd BufEnter,WinEnter * if &ft!="netrw" && &ft!="help" | set relativenumber | endif
  autocmd BufLeave,WinLeave * if &ft!="netrw" && &ft!="help" | set norelativenumber | endif
augroup END
