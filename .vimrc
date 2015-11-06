" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd		" Show (partial) command in status line.
"set showmatch		" Show matching brackets.
"set ignorecase		" Do case insensitive matching
"set smartcase		" Do smart case matching
"set incsearch		" Incremental search
"set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
"set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" Set mapping delays and key code delays{{{

set timeoutlen=400 ttimeoutlen=100

" }}}

" Vim encodings settings{{{

set encoding=utf-8
set fileencodings=utf-8,gbk
set fileencoding=utf-8
set termencoding=utf-8

" }}}


" Tab space settings{{{

set softtabstop=4
set tabstop=4
set shiftwidth=4
set expandtab

" }}}

" Key mappings{{{

let mapleader=","
"let g:mapleader=","

nmap <leader>q :q<cr>
nmap <leader>c :wall<cr>:qall<cr>
nmap <leader>w :w<cr>
nmap <leader>a :wall<cr>

" }}}

" Python settings{{{

let g:pydiction_location = '~/.vim/ftplugin/pydiction/complete-dict'

let g:pydiction_menu_height = 15

let g:pydiction_menu_width = 40

autocmd FileType python set omnifunc=pythoncomplete#Complete

" }}}

" neocompletcache & neosnippet settings{{{
filetype plugin on

let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1

let g:neocomplcache_force_overwrite_completefunc=1
let g:clang_auto_complete=1

imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)": "\<TAB>"

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" }}}

" ctags settings{{{
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
" }}}


" Taglist settings{{{

" open Taglist window on the right side
"let Tlist_Use_Right_Window = 1

let Tlist_WinWidth = 30

" move cursor to the taglist window after opening taglist window
let Tlist_GainFocus_On_ToggleOpen = 1

" close Taglist when a tag is selected
let Tlist_Close_On_Select = 1

" only show tags of current file
"let Tlist_Show_One_File=1

" if taglist window is the last, exit vim
let Tlist_Exit_OnlyWindow=1

" Fold tags that are not active
let Tlist_File_Fold_Auto_Close=1

" Show taglist menu
let Tlist_Show_Menu=1

" auto open taglist when start vim
let Tlist_Auto_Open=0

nmap <leader>tl :Tlist<cr>

" }}}


" miniBufferExplorer settings{{{

"let g:miniBufExplMapWindowNavArrows = 1

"let g:miniBufExplSplitBelow=1

"let g:miniBufExplMapCTabSwitchBufs=1

let g:miniBufExplMapWindowNavVim=1

let g:miniBufExplModSelTarget=1

"let g:miniBufExplForceSyntaxEnable=1

nmap <leader>be :TMiniBufExplorer<cr>
nmap <leader>bn :bNext<cr>
nmap <leader>bp :bprevious<cr>

" }}}


" NERDTree settings{{{

"close NERDTree after opening a selected file
let NERDTreeQuitOnOpen=1

let NERDTreeWinPos = 'right'

let NERDTreeIgnore=['\.o$']

nmap <leader>nt :NERDTreeToggle<cr>

" }}}


" Popup menu settings{{{

highlight Pmenu guibg=darkgrey guifg=black
highlight PmenuSel guibg=lightgray guifg=black

" }}}

