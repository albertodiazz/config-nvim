call plug#begin("~/.config/nvim/plugged")

  "Themes"
  Plug 'dracula/vim'
  "Plugins de Python"
  Plug 'vim-python/python-syntax'
  Plug 'davidhalter/jedi-vim'

  "BUSCADORES
  "Con este busco archivos de forma rapida"
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "Buscador de archivos en barra de tareas"
  Plug 'preservim/nerdtree'
  "Auto close brackets"
  Plug 'jiangmiao/auto-pairs'

  "Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  "Auto update files"
  Plug 'TheZoq2/neovim-auto-autoread' 
  "Plug Flake8
  Plug 'nvie/vim-flake8'

  "React Workflow"
  Plug 'SirVer/ultisnips'
  Plug 'mlaursen/vim-react-snippets'

  "Github WorkFlow
  Plug 'airblade/vim-gitgutter'


call plug#end()

"Apariencia"
syntax on
colorscheme dracula 
let g:python_highlight_all = 1
let g:fzf_layout = { 'down': '~20%' }
highlight clear LineNr ctermfg=grey ctermbg=white
hi Directory guifg=#FF0000 ctermfg=white

"Workflow"
set splitright
set relativenumber
let g:jedi#environment_path = "/mnt/d/trabajo/cocay/ramodelacion_Mide/radioGrafia_BancoCentral/Backend_Unbuntu/venv/lib/python3.6"

autocmd BufWritePost *.py call flake8#Flake8()

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
nnoremap <C-p> :vsplit +term<CR>
nnoremap <C-;> :sp +term<CR>
nnoremap <C-f> :FZF<CR>
nnoremap <C-d> :q<CR>
nnoremap <C-s> :w<CR> 
nnoremap <silent> <c-Up> :vertical resize -1<CR>
nnoremap <silent> <c-Down> :vertical resize +1<CR>

"Github keyMaps
noremap ]h :GitGutterNextHunk<CR>
noremap [h :GitGutterPrevHunk<CR>
