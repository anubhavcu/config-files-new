let mapleader= " "
set relativenumber
set nu rnu  " for relative hybrid numbers
" set  encoding=UTF-8
" for case sensitive search if any capital character is present otherwise search all
set ignorecase
set smartcase
set smarttab 
set cindent 

set hlsearch " highlight search as you type
set incsearch
set showcmd
syntax on

set tabstop=2 
set shiftwidth=2 
" use spaces instead of tab characters
set expandtab 
set hidden

set updatetime=100 
set shortmess+=c
set mouse+=a
set signcolumn=yes
set colorcolumn=110
highlight ColorColumn ctermbg=0 guibg=lightgrey
set noswapfile
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
inoremap <Left> :echoe "Use h"<CR>
inoremap <Right> :echoe "Use l"<CR>
inoremap <Up> :echoe "Use k"<CR>
inoremap <Down> :echoe "Use j"<CR>

" switching between split windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" creating a split 
nnoremap <leader>v <C-W>v 
nnoremap <leader>h <C-W>s

" saving current buffer
nnoremap <leader>o :w <cr>

"quitting current buffer - no save
nnoremap <leader>q :q!<cr>

" move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
nnoremap <leader>k :m-2<cr>gv=gv
nnoremap <leader>j :m'>+<cr>gv=gv

" optional to leave insert mode
inoremap jj <ESC>

" for using system clipboard(osx/linux)
set clipboard=unnamedplus

" ==================Plugins begin===============

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')


" basic plugins 
Plug 'tpope/vim-fugitive'   " for git (refer repo for usage)
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-commentary' " for commenting a line or block
Plug 'jeetsukumaran/vim-buffergator'    " buffers explorer
Plug 'tpope/vim-surround'
Plug 'tpope/vim-obsession'  " storing vim sessions
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'easymotion/vim-easymotion'
Plug 'frazrepo/vim-rainbow'         " for colored paranthesis -- check advanced config on git if needed
Plug 'morhetz/gruvbox'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" TS syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}



call plug#end()
" ==================Plugins end ================

" =============== Plugin specific configs 

"================== FZF 
"for all files
nnoremap <C-p> :Files<CR> 
" for git repos
nnoremap <C-f> :GFiles<CR>
nnoremap <C-c> :Commits<CR>
" Some relevant commands
" :Commit 
" :Files (similar to :GFiles)
" GFiles? git files (git status)

let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

" ignore node modules and more
let $FZF_DEFAULT_COMMAND='find . \( -name node_modules -o -name .git \) -prune -o -print'


" =============== vim-commentary
autocmd FileType apache setlocal commentstring=#\ %s    "for supporting multiple languages

" ========== buffergator
let g:buffergator_suppress_keymaps = 1
nnoremap <Leader>b :BuffergatorToggle<CR>
let g:buffergator_viewport_split_policy="T"
let g:buffergator_autoexpand_on_split=0
let g:buffergator_split_size=10
let g:buffergator_display_regime='filepath'



" ================== gitgutter
set signcolumn=yes

nmap ]h <Plug>(GitGutterNextHunk) "same as default
nmap [h <Plug>(GitGutterPrevHunk) "same as default

nmap ghs <Plug>(GitGutterStageHunk)
nmap ghu <Plug>(GitGutterUndoHunk)

let g:gitgutter_sign_added = '✚'
let g:gitgutter_sign_modified = '✹'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '-'

" ========== vim obsession
" vim-obsession- adding to statusline
set statusline+=%{ObsessionStatus()}

" ======= vim-rainbow
let g:rainbow_active = 1



" ========== easymotion
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

" ================gruvbox
colorscheme gruvbox
set background=dark
" ----------- below is optional (use if not working properly)
" autocmd vimenter * colorscheme gruvbox
" set background=dark
" let g:gruvbox_bold=1
" let g:gruvbox_contrast_dark = 'hard'

"================= nerdtree remap
nnoremap <Leader>n : NERDTreeToggle<CR>
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

 let g:WebDevIconsUnicodeDecorateFolderNodes = 1
 let g:NERDTreeGitStatusNodeColorization = 1
 let g:NERDTreeColorMapCustom = {
     \ "Staged"    : "#0ee375",
     \ "Modified"  : "#d9bf91",
     \ "Renamed"   : "#51C9FC",
     \ "Untracked" : "#FCE77C",
     \ "Unmerged"  : "#FC51E6",
     \ "Dirty"     : "#FFBD61",
     \ "Clean"     : "#87939A",
     \ "Ignored"   : "#808080"
     \ }


" let g:NERDTreeIgnore = ['^node_modules$']

" this command formats file on save (for that configre coc-settings.json file in ~/.config/nvim/coc-settings.json)
" for the files not specified use :Format
" === implemented in coc-config file
" prettier command for coc
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" let g:prettier#config#single_quote = 'true'



" ======================coc

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
      \ 'coc-tslint-plugin',
      \ 'coc-styled-components',
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



"=============== plugin specific end==============
map <F4> :!ls<CR>:e
"avoid commentiong when moving with o/O => needed to be at the end of the file
set formatoptions-=cro
au FileType * set fo-=c fo-=r fo-=o


