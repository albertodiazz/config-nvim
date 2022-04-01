call plug#begin("~/.config/nvim/plugged")

"Themes"
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
"Plugins de Python"
Plug 'vim-python/python-syntax'
" FIXME : Me parece que el autocompletado no
" lee librerias como time
Plug 'davidhalter/jedi-vim'

"BUSCADORES
"Con este busco archivos de forma rapida"
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
"Buscador de archivos en barra de tareas"
Plug 'preservim/nerdtree'
"Auto close brackets"
Plug 'jiangmiao/auto-pairs'

"Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'BurntSushi/ripgrep'

"Auto update files"
Plug 'TheZoq2/neovim-auto-autoread' 
"Plug Flake8
" FIXME
Plug 'nvie/vim-flake8'

"React Workflow"
Plug 'SirVer/ultisnips'
Plug 'mlaursen/vim-react-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'


"Github WorkFlow
Plug 'airblade/vim-gitgutter'

"Comentar y descomentar
Plug 'tpope/vim-commentary'
"Indent Python
Plug 'Vimjas/vim-python-pep8-indent'

call plug#end()

let g:ale_lint_on_enter = 1
let g:ale_fix_on_save = 1

"Apariencia"
let g:airline#extensions#tabline#enabled = 1
syntax on
colorscheme dracula 
let g:python_highlight_all = 1
let g:fzf_layout = { 'down': '~10%' }
highlight clear LineNr ctermfg=grey ctermbg=white
hi Directory guifg=#FF0000 ctermfg=white

"Workflow"
set splitright
set relativenumber
" FIXME
let g:flake8_show_in_file=1  " show
let g:flake8_show_in_gutter=1  " show"

" IMPORTANTE solo ocupar cuando necesitemos ver los cambios en archivos
" en timepo real, tipo un csv como base de datos etc
" --------------------------------------------------------
" set autoread
" if has('nvim') "Prevent errors when using standard 
"     autocmd VimEnter * AutoreadLoop
" endif"
" --------------------------------------------------------

"ShortCut"
nnoremap <C-b> :NERDTree<CR>     
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-n> :Telescope<CR>
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
" nnoremap <C-p> :vsplit +term<CR>
nnoremap <C-;> :sp +term<CR>
" nnoremap <C-f> :FZF<CR>
nnoremap <C-d> :q<CR>
nnoremap <C-w> :bd<CR>
nnoremap <C-s> :w<CR> 
nnoremap <silent> <c-Up> :vertical resize -1<CR>
nnoremap <silent> <c-Down> :vertical resize +1<CR>
nnoremap <tab> :bnext<CR>

"Github keyMaps
noremap ]h :GitGutterNextHunk<CR>
noremap [h :GitGutterPrevHunk<CR>
" FIXME
autocmd FileType python map <buffer> <C-l> :call flake8#Flake8()<CR>
