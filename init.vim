call plug#begin("~/.config/nvim/plugged")
"Themes"
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
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
" Aun no se si este plugin me sirva
Plug 'SirVer/ultisnips'
"React Workflow"
Plug 'mlaursen/vim-react-snippets'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'mattn/emmet-vim'
"Github WorkFlow
Plug 'airblade/vim-gitgutter'
"Comentar y descomentar
Plug 'tpope/vim-commentary'
"Indent Python
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'davidhalter/jedi-vim'
"Unity Workflow
Plug 'OmniSharp/omnisharp-vim'
" Ale lint de sintaxys
Plug 'dense-analysis/ale'
" Autocomplete que instale para Unity
Plug 'prabirshrestha/asyncomplete.vim'
" Markdown para README
" Para instalar esto tuve que ir a la carpeta
" plugged/markdown-preview.nvim/app y correr yarn install en WSL
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'junegunn/goyo.vim'
" GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'  }
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Similar al Grep de Telescope
Plug 'dyng/ctrlsf.vim'
call plug#end()

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
set number relativenumber
hi! EndOfBuffer ctermbg=bg ctermfg=bg guibg=bg guifg=bg
" ConfigPlugins
" Esto configura el servidor donde levanta los archivos .md
let g:mkdp_refresh_slow = 0
let g:mkdp_port = '3000'
" let g:mkdp_markdown_css = expand("~/github-markdown.css")

"TODO: FIXME
let g:flake8_show_in_file=1  " show
let g:flake8_show_in_gutter=1  " show"

" Setup UNITY
" Con esto le decimos que estamos usando WSL
let g:OmniSharp_translate_cygwin_wsl = 1
" Tell ALE to use OmniSharp for linting C# files, and no other linters.
let g:ale_linters = { 'cs': ['OmniSharp'] }

" acp 
" Por alguna razon eso hace que no me aparesca el Autocomplete
" en live_grep lo cual es bueno ya que me ocasionaba coasas extrannas
let g:acp_enableAtStartup = 0

nnoremap <C-b> :NERDTree<CR>     
nnoremap <C-b> :NERDTreeToggle<CR>
nnoremap <C-n> :Telescope<CR>
nnoremap <C-f> :Telescope find_files<CR>
nnoremap <C-g> :Telescope live_grep<CR>
" nnoremap <C-f> :FZF<CR>
nnoremap <C-d> :q<CR>
nnoremap <C-w> :bd<CR>
nnoremap <C-s> :w<CR> 
nnoremap <silent> <c-Up> :vertical resize -1<CR>
nnoremap <silent> <c-Down> :vertical resize +1<CR>
nnoremap <tab> :bnext<CR>
" Para abrir la terminal
" nnoremap <C-p> :vsplit +term<CR>
" nnoremap <C-;> :sp +term<CR>
let mapleader = ","
nnoremap <Leader>ts :vsplit +term <CR>
nnoremap <Leader>tv :sp +term<CR>
tnoremap <Esc> <C-\><C-n>
" Esto centra mi cursor
" Con Leader activamos la accion al presionar dos veces las teclas
" No necesita de mi leader map
nnoremap <Leader>zz :let &scrolloff=999-&scrolloff<CR>

"TODO: FIXME [Flask no funciona de forma automatica]
autocmd FileType python map <buffer> <C-l> :call flake8#Flake8()<CR>
" Para que al abrir la terminal desdes vim no me salgan los numeros
autocmd TermOpen * setlocal nonumber norelativenumber
