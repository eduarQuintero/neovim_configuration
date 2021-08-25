":::::::::::::::::::::::::::::::::instalacion de plugins::::::::::::::::::::::::::::::::::::

call plug#begin('~/.config/nvim/plugged') 	"directorio donde se van a instalar los plugins

"plugins
Plug 'morhetz/gruvbox'			"tema
Plug 'vim-airline/vim-airline'		"diseño de la barra en la cual se muestran los modos, la linea, etc.
Plug 'vim-airline/vim-airline-themes'	"temas para el vim-airline
Plug 'easymotion/vim-easymotion'	"plugin para mapear caracteres o palabras rapidas en el codigo
Plug 'preservim/nerdtree'		"gestor de archivos en forma de arbol.
Plug 'christoomey/vim-tmux-navigator'	"poder navegar entre archivos abiertos
Plug 'jiangmiao/auto-pairs'		"autocompletado de llaves, corchetes, etc.
Plug 'neovim/nvim-lspconfig'		"servidores de lenguajes
Plug 'nvim-lua/completion-nvim'		"autocompletado de lenguajes
Plug 'preservim/nerdcommenter'		"comentar rapido codigo
Plug 'ryanoasis/vim-devicons'		"iconos para los archivos pero requiere nerdfonts

call plug#end() 			"cerramos el llamado de los plugins

":::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"CONFIGURACIONES BASICAS 

set number 				"muestra los numeros de cada linea en la parte izquierda 
set relativenumber 			"la distribucion de los numeros en lineas de manera relativa
set mouse=a 				"permite la interaccion con el mouse
set noshowmode				"me deja de mostrar el modo en el que estamos 'normal, insert, visual, etc'
syntax enable 				"activa el coloreado de sintaxis en algunos tipos de archivos como html, c, c++
set encoding=utf-8 			"permite setear la codificación de archivos para aceptar caracteres especiales
set sw=4 				"la indentación genera 4 espacios
set nowrap				"el texto en una linea no baja a la siguiente, solo continua en la misma hasta el infinito.
set noswapfile				"para evitar el mensaje que sale al abrir algunos archivos sobre swap.
set clipboard+=unnamedplus		"para poder utilizar el portapapeles del sistema operativo 'esto permite poder copiar y pegar desde cualquier parte a nvim y viceversa.	
"muestra la columna limite a 120 caracteres
"set colorcolumns=120
"insertar espacios en lugar de tabs
"set expandtab
"ignorar mayusculas al hacer busquedas
"set ignorecase
"no ignorar mayusculas al hacer busquedas
"set smartcase
"corregir palabras usando diccionario español o ingles
"set spelllang=en,es
"espacio hacia el final de las lineas al desplazarnos
"set scrolloff=7

"CONFIGURACION DEL TEMA
set termguicolors 			"activa el true color en la terminal
let g:gruvbox_contrast_dark = 'hard'	"esto esta en la documentacion del tema
colorscheme gruvbox			"indicamos el tema gruvbox

"hace que no te autocomplete, no autoinserte, no autoseleccione, esto nos
"ayuda con lsp que autocompleta automáticamente
set completeopt=menuone,noinsert,noselect

"::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
"CONFIGURACION DE PLUGINS

"configuracion de vim-airline
let g:airline#extensions#tabline#enabled = 1	"muestra la linea de pestaña en la que estamos buffer
let g:airline#extensions#tabline#formatter = 'unique_tail'	"muestra solo el nombre del archivo que estamos modificando
let g:airline_theme='gruvbox'

"configuracion de nerdtree
"mapeando el abrir y cerrar de nerdtree con nerdtreetoggle vemos los archivos en el arbol y podemos cerrarlo a la vez, map es la C mayuscula representa el
"control y -n la tecla n lo que indica que realizará la siguiente funcion de excribir el comando NERDTreeToggle y CR significa ENTER.
map <F4> :NERDTreeToggle<CR>

"CONFIGURANDO AL TECLA LIDER
let mapleader=" "

"mapeando tecla para guardar rapido
nmap <leader>w :w<CR>
"mapeando tecla para salir rapido
nmap <leader>q :q<CR>

"configurando easymotion
nmap <leader>s <Plug>(easymotion-s2)

"el llamado al servidor de lsp de python
"con lo que esta dentro de la llave llamo al autocompletado
lua require'lspconfig'.pyright.setup{on_attach=require'completion'.on_attach}

"mapeo de teclas para el lsp
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Avoid showing message extra message when using completion
set shortmess+=c
