set encoding=utf-8

" Set backup directory
set backupdir=~/.tmp/nvim_backups

" " ------ USABILITY

" Syntax highlighting
syntax on
" Line numbers
set number

" Detect file types and act upon it
filetype on
filetype plugin on
filetype indent on

" Reload files changed outside vim
set autoread

" UTF-8 encoding
set encoding=utf-8
set fileencoding=utf-8

" by default, in insert mode backspace won't delete over line breaks, or automatically-inserted indentation, let's change that
set backspace=indent,eol,start

" don't unload buffers when they are abandoned, instead stay in the background
set hidden

" set unix line endings
set fileformat=unix
" when reading files try unix line endings then dos, also use unix for new buffers
set fileformats=unix,dos

" save up to 100 marks, enable capital marks
set viminfo='100,f1

" screen will not be redrawn while running macros, registers or other non-typed comments
set lazyredraw

" set , as mapleader
let mapleader = ";"
" set ; as local mapleader
let maplocalleader = ","

" ,j and ,k to navigate buffers
noremap <leader>j :bp<CR>
noremap <leader>k :bn<CR>

" " windows like clipboard
" " yank to and paste from the clipboard without prepending "* to commands
set clipboard=unnamedplus

" Search settings
" set incsearch " find the next match as we type
set hlsearch " highlight search by default
" press Escape to remove previous search highlighting
nnoremap <esc> :noh<return><esc>

" " suggestion for normal mode commands
set wildmode=list:longest

" keep cursor visible within 5 lines when scrolling
set scrolloff=5

" indentation
set expandtab " spaces insteand of tabs
set autoindent " identation based on line above
set smartindent " idk what it's supposed to do
set shiftwidth=2 "when reading, tabs are displayed as 4 spaces
set softtabstop=2 " in insert mode, tab inserts 4 spaces

" mark for column 80
set colorcolumn=80

" Display status line
set laststatus=2

" On file types...
" .md files are markdown files
autocmd BufNewFile,BufRead *.md setlocal ft=markdown
" .adoc files are Asciidoc files
autocmd BufNewFile,BufRead *.adoc setlocal ft=asciidoc
" Correct indentatio for Makefiles
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0
" Use // to comment in Asciidoc files
autocmd Filetype asciidoc set commentstring=//\ %s

" Use 24-bit colorscheme
if (has("termguicolors"))
  set termguicolors
else
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" Colorscheme
colorscheme tender

" Quick-scope hack to only display colors when pressing f and related motions

let g:qs_enable = 0
let g:qs_enable_char_list = [ 'f', 'F', 't', 'T' ]

function! Quick_scope_selective(movement)
    let needs_disabling = 0
    if !g:qs_enable
        QuickScopeToggle
        redraw
        let needs_disabling = 1
    endif
    let letter = nr2char(getchar())
    if needs_disabling
        QuickScopeToggle
    endif
    return a:movement . letter
endfunction

" quick-scope maps, operator-pending mode included (can do 'df' with hint)
for i in g:qs_enable_char_list
	execute 'noremap <expr> <silent>' . i . " Quick_scope_selective('". i . "')"
endfor



" " Display special characters differently
" set listchars=nbsp:¬,eol:¶,tab:>-,extends:»,precedes:«,trail:•
set list
set listchars=nbsp:¬,tab:>-

" Increment letter sequences (vim-visual-increment)
set nrformats=alpha

" Mappings for easyalign
" - in visual mode :
vmap <Enter> <Plug>(EasyAlign)
" " " - in normal mode :
nmap ga <Plug>(EasyAlign)

" Neomake
let g:neomake_error_sign = {'text': '✖', 'texthl': 'NeomakeError'}
let g:neomake_warning_sign = {'text': '➤', 'texthl': 'NeomakeWarning'}
let g:neomake_message_sign = {'text': '➤', 'texthl': 'NeomakeInformation'}
let g:neomake_info_sign = {'text': 'ℹ', 'texthl': 'NeomakeMessage'}

" Run Neomake when writing file
autocmd! BufWritePost * Neomake


" Folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

" Python PEP8
" and flag unnecessary whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufNewFile,BufRead *.py
  \ set tabstop=4
  \ set softtabstop=4
  \ set shiftwidth=4
  \ set textwidth=79
  \ set expandtab
  \ set autoindent
  \ set fileformat=unix
  \ match BadWhitespace /\s\+$/

