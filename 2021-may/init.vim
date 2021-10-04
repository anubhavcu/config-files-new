" =================new config file for neovim for js =============================
" au BufWrite * :Autoformat

" map leader key to space (default was \)
let mapleader = " "
" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

set relativenumber
set nu rnu   " for relative-hybrid numbers"

set encoding=UTF-8  " specially for devicons

" for case sensitive search if any capital character is present otherwise search all
set ignorecase
set smartcase

set smarttab
set cindent
set tabstop=2
set shiftwidth=2
" always uses spaces instead of tab characters
set expandtab
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup " Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=100

" don't give |ins-completion-menu| messages.
set shortmess+=c

set mouse+=a
" always show signcolumns
set signcolumn=yes

" for lightgrey color line in the right side--- adjust colorcolumn value for
" positioning or make it variable later
set colorcolumn=110
highlight ColorColumn ctermbg=0 guibg=lightgrey

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

" switching between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


" saving current buffer
nnoremap <leader>o :w <cr>

" open terminal
nnoremap <leader>t :ter<cr>
" nnoremap <leader>v :vert<cr>


"move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" optional to leave insert mode
inoremap jk <ESC>



" ===================================== Plugins ============================


" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

" miscellaneous
Plug 'tpope/vim-fugitive'   " for git (refer repo for usage)
Plug 'tpope/vim-commentary' " for commenting a line or block
Plug 'jeetsukumaran/vim-buffergator'    " buffers explorer
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'  " storing vim sessions
" Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'

" Plug 'Xuyuanp/nerdtree-git-plugin'

" for theming
Plug 'vim-airline/vim-airline'  " statusline theme
Plug 'vim-airline/vim-airline-themes'   " statusline theme
Plug 'morhetz/gruvbox'
" Plug 'ryanoasis/vim-devicons'
Plug 'frazrepo/vim-rainbow'         " for colored paranthesis -- check advanced config on git if needed



" File finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'


"syntax
" Plug 'sheerun/vim-polyglot'
" Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
" Plug 'Chiel92/vim-autoformat'




Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'mlaursen/vim-react-snippets'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
" -- will see if below plugin is required
Plug 'mattn/emmet-vim'    " required for jsx files, coc works fine with standalone html files but doesn't show snippets in jsx file

"Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Plug 'scrooloose/nerdcommenter'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
" Plug 'christoomey/vim-tmux-navigator'

" plugin for nvim in browser
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" for syntax highlighting for js and jsx files ( both are required)
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'

Plug 'kevinoid/vim-jsonc'  " commenting json files 



" Initialize plugin system
call plug#end()


" ====================================================================
" ----------------Plugin configs-----------------------------------



" gitgutter
" togglegitgutter:
" turn off with :GitGutterDisable
" turn on with :GitGutterEnable
" toggle with :GitGutterToggle.

" to move between changes (also called hunks)
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" -------------------------------------------------
"vim-rainbow
let g:rainbow_active = 1

" ----------------------------------------------

" easymotion
" " <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" " s{char}{char} to move to {char}{char}
" nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader>l <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)


" ----------------------------------------------
"buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorToggle<CR>
let g:buffergator_viewport_split_policy="T"
let g:buffergator_autoexpand_on_split=0
let g:buffergator_split_size=10
let g:buffergator_display_regime='filepath'


" -----------------------------------------------
"vim obsession
" vim-obsession- adding to statusline
set statusline+=%{ObsessionStatus()}
" for saving a session - :Obsession
"  --- or :Obsession [session_name]
" for deleting a session - :Obsession!
" for restoring a session - neovim -S [session_name(if saved)]
" ------------or :source Session.vim
"   ------------or :source [session_name(if saved)]


" -------------------------------------------------
" vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s    " for supporting multiple languages


" ---------------------------------------------------
"gruvbox
colorscheme gruvbox
set background=dark
" ----------- below is optional (use if not working properly)
" autocmd vimenter * colorscheme gruvbox
" set background=dark
" let g:gruvbox_bold=1
" let g:gruvbox_contrast_dark = 'hard'


" ----------------------------------------------------------
" fzf
" nnoremap <C-p> :FZF<CR>
nnoremap <C-p> :Files<CR>
" :Ag => to search for text within files - remember to install silversearcher for this to work

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}


" fzf ignore node modules
" for this to work install silversearcher -   apt-get install silversearcher-ag
"https://github.com/ggreer/the_silver_searcher
let $FZF_DEFAULT_COMMAND = 'ag -g  ""'

"below one also searches for hidden files - ignoring node modules
" use below if want to search for hidden files also
" let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -f -g ""'


" --------------------------------------------------------------
" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

" ----------------------------------------------------------
"airline-themes  --- checkout more themes for airline later
let g:airline_theme='angr'


" --------------------------------------------------------------------------
"nerdtree remap
nnoremap <Leader>n : NERDTreeToggle<CR>
" nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
"open nerdtree when neovim lauches(also using this for preventing multiple nerdtree windows opening on starting it first time )   -- this problem of opening multiple windows was due to SyncTree function below (which was intended to highlight the current buffer in nerdtree)  ( to highlight current buffer in nerdtree see keybinding below, or use :NERDTreeFind)
" autocmd VimEnter *  NERDTree


"below lines prevent nerdtree from opening if opening a saved session.  -- use this option if 'starting nerdtree at vim startup' is on
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") && v:this_session == "" | NERDTree | endif

nmap ,n :NERDTreeFind<CR>


" close vim if only window left open is nerdtree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" sync open file with NERDTree
" " Check if NERDTree is open or active
" function! IsNERDTreeOpen()
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction


" Highlight currently open buffer in NERDTree **awesome
" autocmd BufEnter * call SyncTree()
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" On startup, focus NERDTree if opening a directory, focus file if opening a file.
" let g:nerdtree_tabs_smart_startup_focus = 1

let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0


"disable arrow icons at the left side of folders for nerdtree
" let g:NERDTreeDirArrowExpandable = "\u00a0"
" let g:NERDTreeDirArrowCollapsible = "\u00a0"
" --or use this option
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

"color highlights file names
let g:NERDTreeFileExtensionHighlightFullName = 1

" --------------------xxxxxxxxxxxxxxx-----------------
" git icons still NOT working --- debug it soon
" let g:NERDTreeGitStatusShowClean = 1
" let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heave feature too. default: normal
let g:NERDTreeGitStatusIndicatorMapCustom = {
      \ 'Modified'  :'✹',
      \ 'Staged'    :'✚',
      \ 'Untracked' :'✭',
      \ 'Renamed'   :'➜',
      \ 'Unmerged'  :'═',
      \ 'Deleted'   :'✖',
      \ 'Dirty'     :'✗',
      \ 'Ignored'   :'☒',
      \ 'Clean'     :'✔︎',
      \ 'Unknown'   :'?',
      \ }

" let g:WebDevIconsUnicodeDecorateFolderNodes = 1
" let g:NERDTreeGitStatusNodeColorization = 1
" let g:NERDTreeColorMapCustom = {
"     \ "Staged"    : "#0ee375",
"     \ "Modified"  : "#d9bf91",
"     \ "Renamed"   : "#51C9FC",
"     \ "Untracked" : "#FCE77C",
"     \ "Unmerged"  : "#FC51E6",
"     \ "Dirty"     : "#FFBD61",
"     \ "Clean"     : "#87939A",
"     \ "Ignored"   : "#808080"
"     \ }


" let g:NERDTreeIgnore = ['^node_modules$']

" ----------------------------------------------------------------------

" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync



" this command formats file on save (for that configre coc-settings.json file in ~/.config/nvim/coc-settings.json)
" for the files not specified use :Format
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile



" ----------------------------------------------
" coc config

" check this option for config later
" let g:coc_filetype_map

let g:coc_global_extensions = [
      \ 'coc-snippets',
      \ 'coc-pairs',
      \ 'coc-tsserver',
      \ 'coc-eslint',
      \ 'coc-prettier',
      \ 'coc-json',
      \ 'coc-emmet',
      \ 'coc-css', 
      \ 'coc-html', 
      \ 'coc-tslint-plugin'
      \ ]


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1

  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()


" \ 'coc-eslint',
" coc snippets   - press enter to select a suggestion whether a snippet or keyword , use tab to navigate
inoremap <silent><expr> <cr>
      \ pumvisible() ? coc#_select_confirm() :
      \ "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use <c-space> to trigger completion. ( when in insert mode and suggestion not showing )
inoremap <silent><expr> <c-space> coc#refresh()


" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"-----------------------------------------------
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
"---------------------------------------------------

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.  - if - inner function || af - around function
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>



au FocusGained,BufEnter * :checktime

map <F4> :!ls<CR>:e


" ==============================================================
" to avoid commenting when moving to a new line with o/O from a commented line
set formatoptions-=cro
au FileType * set fo-=c fo-=r fo-=o
