"   _   ________  ______  _____
"  | | / /  _/  |/  / _ \/ ___/
"  | |/ // // /|_/ / , _/ /__  
"  |___/___/_/  /_/_/|_|\___/  

" author: somsky

set termguicolors

" ===============================
" ======= PLUGIN SECTION ========
" ===============================

call plug#begin('~/.local/share/nvim/plugged')

  " All for them fancy looks
  Plug 'morhetz/gruvbox'
  Plug 'jacoborus/tender.vim'
  Plug 'alessandroyorba/despacio'
  Plug 'sheerun/vim-polyglot'

  " File explorer
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'

  " Syntax Highlighting for Typescript
  Plug 'leafgarland/typescript-vim'

  " Auto-close brackets
  Plug 'Raimondi/delimitMate'

  " Code completion engine
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
 
  " Fuzzy find files
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Show indentation
  Plug 'Yggdroot/indentLine'

  " Tex Support
  Plug 'lervag/vimtex'
  Plug 'Konfekt/FastFold'
  Plug 'matze/vim-tex-fold'

  " Git integration
  Plug 'tpope/vim-fugitive'

  " Rainbow brackets
  Plug 'frazrepo/vim-rainbow'

  " Debugging
  Plug 'puremourning/vimspector'

  "Dart/Flutter Support
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'

  " Hide other buffers
  Plug 'markstory/vim-zoomwin'

  " ========
  " Plugins to keep in Mind for the future
  " ========

  " Quickly comment in/out pieces of code
  " Plug 'preservim/nerdcommenter'
  
call plug#end()

" ===============================
" ===== COC COMPAT SETTINGS =====
" ===============================

" more information at https://github.com/neoclide/coc.nvim
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <leader> dp <Plug>(coc-diagnostic-prev)
nmap <leader> dn <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')%{FugitiveStatusline()}}

" ====================================
" ====== PERSONAL VIM SETTINGS =======
" ====================================

syntax enable

" show line numbers
set number

" no search highlighting
set nohlsearch

" scroll before cursor gets to end of screen
set scrolloff=5
set sidescrolloff=15

let mapleader = ","

" spaces instead of tabs
set expandtab

" indentation
set tabstop=2
set shiftwidth=2

" don't wrap lines
set nowrap

" set correct cursor position after starting a new line
set autoindent
set smartindent

" auto-close curly brackets 2 lines below
inoremap {<cr> {<cr>}<c-o><s-o>

" set colorscheme
colorscheme tender

" more natural opening of splits
set splitright
set splitbelow

" slight highlight on line number and line where the carret is located
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Reload file contents when changed externally 
set autoread
au FocusGained,BufEnter * :silent! !

" no swap files
set noswapfile

" ignore case when searching
set ignorecase

" search case sensitive when needle contains uppercase letters
set smartcase

" start searching before hitting enter
set incsearch

" set mark at column 100 in tex files
autocmd FileType tex set colorcolumn=100

" use system clipboard for copy/paste operations
set clipboard+=unnamedplus

set relativenumber

" quicksave
noremap <Leader>s :update<CR>

" navigate between splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier vertical resizing
nnoremap <silent> <leader>r+ :vertical resize +20<CR>
nnoremap <silent> <leader>r- :vertical resize -20<CR>

" Tab/Shift+Tab to circle buffers
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

" ====================================
" ===== PERSONAL PLUGIN SETTINGS =====
" ====================================

" vim-Airline Settings
let g:airline_theme='tender'
let g:airline#extensions#tabline#enabled=1

" close NERDTree if a file gets opened
let NERDTreeQuitOnOpen=1

" custom keybindings
nmap <leader>nt :NERDTreeToggle<cr>
nmap <leader>ff :Ag<cr>
nmap <leader>cp :GFiles<cr>
nmap <Leader>vc :VimtexCompile<CR>

" quicksave
noremap <Leader>s :update<CR>

" navigate between splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Latex Support
let g:tex_flavor  = 'latex'
let g:tex_conceal = ''
let g:vimtex_fold_manual = 1
let g:vimtex_latexmk_continuous = 1
let g:vimtex_compiler_progname = 'nvr'
let g:vimtex_view_method = 'zathura'

" Nvim python environment settings
" used for pudb plugin
if has('nvim')
    let g:python_host_prog='/usr/bin/python2'
    let g:python3_host_prog='/usr/bin/python'
    let g:pudb_python='/usr/bin/python'
    let g:pudb_breakpoint_symbol='☠'
endif


" Execute FZF in a floating window
function! FloatingFZF()
    let width = float2nr(&columns * 0.8)
    let height = float2nr(&lines * 0.6)
    let opts = { 'relative': 'editor',
               \ 'row': (&lines - height) / 2,
               \ 'col': (&columns - width) / 2,
               \ 'width': width,
               \ 'height': height }
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" enable rainbow brackets by default
let g:rainbow_active = 1

" It should be:
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : 'latexbuild',
    \}

let g:vimspector_enable_mappings = 'HUMAN'
