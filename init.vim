call plug#begin("~/.config/nvim/plugged")

  "Themes"
  Plug 'tomasr/molokai'
  "Plugins de Python"
  Plug 'vim-python/python-syntax'
  Plug 'davidhalter/jedi-vim'
  "Con este busco archivos de forma rapida"
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "Buscador de archivos en barra de tareas"
  Plug 'preservim/nerdtree'
  "Buscador palabras"
  Plug 'dyng/ctrlsf.vim'
  "Auto close brackets"
  Plug 'jiangmiao/auto-pairs'
  "Auto update files"
  Plug 'TheZoq2/neovim-auto-autoread' 
  "Plug Flake8
  Plug 'nvie/vim-flake8'

call plug#end()

"Apariencia"
syntax on
colorscheme molokai 
let g:python_highlight_all = 1
let g:fzf_layout = { 'down': '~20%' }

"Workflow"
set splitright
set relativenumber
let g:jedi#environment_path = "/usr/bin/python3"

autocmd BufWritePost *.py call flake8#Flake8()

"Autoreload files when changed externally
set autoread
if has('nvim') "Prevent errors when using standard 
    autocmd VimEnter * AutoreadLoop
endif"

"ShortCut"
nnoremap <C-b> :NERDTree<CR>     
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-p> :vsplit +term<CR>
nnoremap <C-f> :FZF<CR>
nnoremap <C-d> :q<CR>
nnoremap <C-s> :w<CR> 




