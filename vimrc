"this vimrc is configured for web dev and running python code- see keymaps below -- minor tweaks required
" refer to old vimrc for reference
" set -o vi   -- use this in bashrc for vi mode in terminal


set path+=**     " use :find FILENAME (or use :find *Name) - basically search through all directories and subdirectories for a file (pure vim, in case you don't want to use ctrlp)"
set encoding=UTF-8  " specially for devicons
set nocompatible
syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete    "for using vim's built-in suggestion for autocomplete by checking all files, use <C-n>
set showcmd
set shortmess+=I
set number
set relativenumber
set laststatus=2
set backspace=indent,eol,start
set hidden
set ignorecase
set smartcase
set incsearch
set hls     " highlight search
set tabstop=4
set expandtab   " converts tabs into spaces
filetype plugin indent on
set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4
filetype indent on
" Unbind some useless/annoying default key bindings.
" 'Q' in normal mode enters Ex mode. You almost never want this.
nmap Q <Nop>
" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. You should avoid relying on this too much, but it can
" sometimes be convenient.
set mouse+=a

" Try to prevent bad habits like using the arrow keys for movement.
" Do this in normal mode...
nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

" opening a new window split down/right
set splitbelow
set splitright

" map leader key to space (default was \)
let mapleader = " "

" switching between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" saving current buffer
nnoremap <leader>o :w<cr>

" open terminal
nnoremap <leader>t :ter<cr>
" nnoremap <leader>v :vert<cr>


"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" organise all swap files in one place, note since swap files are not in same directory of file, it will not warn if a file is already open in other buffer
set directory^=$HOME/.vim/temp//
set noswapfile " dont create swp files or any backup files in vim
" to avoid commenting when moving to a new line with o/O from a commented line
au FileType * set fo-=c fo-=r fo-=o


" ------------------ Plugins -----------------------
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'   " file explorer
Plug 'tpope/vim-fugitive'   " for git (refer repo for usage)
Plug 'tpope/vim-commentary' " for commenting a line or block
Plug 'tpope/vim-obsession'  " storing vim sessions
Plug 'jeetsukumaran/vim-buffergator'    " buffers explorer
Plug 'morhetz/gruvbox'      " gruvbox theme
Plug 'vim-airline/vim-airline'  " statusline theme
Plug 'vim-airline/vim-airline-themes'   " statusline theme
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc-python'
Plug 'easymotion/vim-easymotion'
Plug 'vim-python/python-syntax'     " for python syntax
Plug 'Yggdroot/indentline'  " shows lines on indent
Plug 'mxw/vim-jsx'          " for jsx syntax -----DEPRECIATED package
Plug 'maxmellon/vim-jsx-pretty'     " for jsx highlight
Plug 'yuezk/vim-js'     " for enhancing vim-jsx-pretty
Plug 'othree/yajs.vim'      " for js syntax ---NOT good for perfomance
Plug 'mLaursen/vim-react-snippets'
" Plug 'airblade/vim-gitgutter'   " tracking git changes    ---perfomance issues
Plug 'mattn/emmet-vim'      " html css snippets (also understands jsx code )
Plug 'ctrlpvim/ctrlp.vim'   " file, buffer finder
Plug 'leafgarland/typescript-vim'   " for typescript syntax - remove if problem occurs
" Plug 'ap/vim-css-color'     " for identifying colors in a .css file - (not working with vim rainbow)
Plug 'severin-lemaignan/vim-minimap'   " minimap sidebar for overall view - see config below <leader> mm | <leader>mc
Plug 'frazrepo/vim-rainbow'         " for colored paranthesis -- check advanced config on git if needed
Plug 'tpope/vim-surround'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'vimwiki/vimwiki'      "personal wiki for notes etc. - (<leader> ww)- see manual
Plug 'wincent/terminus'     " for cursor change
Plug 'Chiel92/vim-autoformat'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

" ---------- plugin settings ------------------

"vim-devicons
"for devicons to work, downlaod a nerdfont, then extract and paste it into ~/.fonts folder
" let g:webdevicons_conceal_nerdtree_brackets = 0
" let g:webdevicons_enable_airline_tabline = 1
" let g:webdevicons_enable_airline_statusline = 1
" let g:webdevicons_enable_ctrlp = 1
" let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '

" - to downlaod devicons visit - https://www.nerdfonts.com/font-downloads

"vim-surround



"vim-rainbow
" problem working with vim-css-color
let g:rainbow_active = 1




" leafgarland
"automatically indent chained methods as typed
setlocal indentkeys+=0
let g:typescript_indent_disable = 1     "disabling plugins custom indenter

" ctrlp
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_show_hidden = 1

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
            \ 'file': '\.so$\|\.dat$|\.DS_Store$'
            \ }


" python-syntax
let g:python_highlight_all = 1
let g:python_highlight_space_errors = 0
let g:python_highlight_indent_errors = 0

" indentline
let g:indentLine_color_term = 239
set conceallevel=1
let g:indentLine_conceallevel=1


"nerdtree remap
nnoremap <Leader>n : NERDTreeToggle<CR>

" vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s    " for supporting multiple languages

" vim-obsession- adding to statusline
set statusline+=%{ObsessionStatus()}

"buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorToggle<CR>
let g:buffergator_viewport_split_policy="T"
let g:buffergator_autoexpand_on_split=0
let g:buffergator_split_size=10
let g:buffergator_display_regime='filepath'

"gruvbox
autocmd vimenter * colorscheme gruvbox
set background=dark
let g:gruvbox_bold=1
let g:gruvbox_contrast_dark = 'hard'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'


" prettier
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0



" easymotion
" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)



"coc
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1

    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

" let g:coc_snippet_next = '<tab>'

" coc config
let g:coc_global_extensions = [
            \ 'coc-snippets',
            \ 'coc-pairs',
            \ 'coc-prettier',
            \ 'coc-tsserver',
            \ 'coc-json',
            \ ]

" \ 'coc-eslint',
" coc snippets   - press enter to select a suggestion whether a snippet or keyword , use tab to navigate
inoremap <silent><expr> <cr>
            \ pumvisible() ? coc#_select_confirm() :
            \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"



" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" for running python code in current buffer
autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python3' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python3' shellescape(@%, 1)<CR>

" run python code in current buffer
autocmd Filetype python nnoremap <buffer> <leader>r :w<CR>:ter python3 "%"<CR>
autocmd Filetype python nnoremap <buffer> <leader>vr  :w<CR>:vert ter python3 "%"<CR>
" autocmd Filetype python nnoremap <buffer> <F6> :w<CR>:vert ter python3 "%"<CR>
" close current buffer
nnoremap <leader>c :q!<cr>

" vim-autoformat
au BufWrite * :Autoformat   " autoformat files on save (install pep8 in terminal for python and for js install js-beautify)


" install pip3 from terminal for python support (also check for packages like black, flake8 etc if not present(check using pip3 freeze ))


au BufNewFile,BufRead *.py
            \ set tabstop=4
            \ set softtabstop=4
            \ set shiftwidth=4
            \ set textwidth=79
            \ set expandtab
            \ set autoindent
            \ set fileformat=unix


au BufNewFile,BufRead *.js, *.html, *.css
            \ set tabstop=2
            \ set softtabstop=2
            \ set shiftwidth=2
