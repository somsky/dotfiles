"    _____   _____________    ________  ___
"   /  _/ | / /  _/_  __/ |  / /  _/  |/  /
"   / //  |/ // /  / /  | | / // // /|_/ / 
" _/ // /|  // /  / /   | |/ // // /  / /  
"/___/_/ |_/___/ /_(_)  |___/___/_/  /_/   

" author: somsky

" ===============================
" ====== GENERAL SETTINGS =======
" ===============================

syntax enable
set termguicolors
set number
set relativenumber
set nohlsearch
set scrolloff=5
set sidescrolloff=15
set expandtab
set tabstop=2
set shiftwidth=2
set smarttab
set conceallevel=0
set nowrap
set autoindent
set smartindent
set splitright
set splitbelow
set noswapfile
set ignorecase
set smartcase
set incsearch
set autoread
set undofile
set undodir=/tmp

" use system clipboard for copy/paste operations
set clipboard+=unnamedplus

" slight highlight on line number and line where the carret is located
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline

" Reload file contents on BufEnter
au FocusGained,BufEnter * :checktime

let mapleader = ","

" ===============================
" ======= PLUGIN SECTION ========
" ===============================

call plug#begin('~/.local/share/nvim/plugged')
"+=----------------=+ LOOKS & SYNTAX +=----------------=+
  Plug 'morhetz/gruvbox'
  Plug 'jacoborus/tender.vim'
  Plug 'alessandroyorba/despacio'
  Plug 'Yggdroot/indentLine'
  Plug 'vim-airline/vim-airline'
  Plug 'PotatoesMaster/i3-vim-syntax'
  Plug 'frazrepo/vim-rainbow'
"+=----------------=+ FILE HANDLING +=----------------=+
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
"+=--------------=+ LANGAGE SPECIFICS +=--------------=+
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'lervag/vimtex'
  Plug 'Konfekt/FastFold'
  Plug 'matze/vim-tex-fold'
  Plug 'dart-lang/dart-vim-plugin'
  Plug 'thosakwe/vim-flutter'
"+=----------------=+ QUALITY OF LIFE +=----------------=+
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
  Plug 'markstory/vim-zoomwin'
  Plug 'easymotion/vim-easymotion'
  Plug 'jiangmiao/auto-pairs'
"+=----------------=+ OTHER +=----------------=+
  Plug 'tpope/vim-fugitive'
  Plug 'puremourning/vimspector'
call plug#end()

colorscheme tender

" ===============================
" ===== COC COMPAT SETTINGS =====
" ===============================

" more information at https://github.com/neoclide/coc.nvim
set hidden          " if hidden is not set, TextEdit might fail.
set nobackup        " Some servers have issues with backup files, see #649
set nowritebackup
set updatetime=300  "update time for diagnostic messages
set shortmess+=c    " don't give ins-completion-menu messages.
set signcolumn=yes " always show signcolumns

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

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" ===============================
" =========== REMAPS ============
" ===============================

noremap <Leader>s :update<CR>

" navigate between splits easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" easier vertical resizing
nnoremap <silent> <leader>r+ :vertical resize +20<CR>
nnoremap <silent> <leader>r- :vertical resize -20<CR>
"! nnoremap <M-j>    :resize -2<CR>
"! nnoremap <M-k>    :resize +2<CR>
"! nnoremap <M-h>    :vertical resize -2<CR>
"! nnoremap <M-l>    :vertical resize +2<CR>

" Tab/Shift+Tab to circle buffers
nnoremap <TAB> :bn<CR>
nnoremap <S-TAB> :bp<CR>

nmap <silent> <leader>nt :NERDTreeToggle<cr>
nmap <leader>ff :Ag<cr>
nmap <leader>cp :GFiles<cr>
nmap <Leader>vc :VimtexCompile<CR>

" 2 character search motion
nmap + <Plug>(easymotion-s2)

" Mardown preview
nmap <leader>mb :MarkdownPreview<cr>
nmap <leader>ms :MarkdownPreviewStop<cr>

"fancy git graph
nmap <leader>gg :terminal git lg2<cr>

" reload config
nmap <leader>rc :so ~/.config/nvim/init.vim<cr>

" error next/previous
nmap <leader> en <Plug>(coc-diagnostic-prev)
nmap <leader> ep <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Close Buffers fast
nmap <silent> <leader>q :bd<cr>

" ====================================
" ============== OTHER ===============
" ====================================

" vim-Airline Settings
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts = 1

" close NERDTree if a file gets opened
" let NERDTreeQuitOnOpen=1

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

" vim markdown browser
let g:mkdp_browser = 'firefox'

