""comando para que habra el chd en mi espacio de trabajo
cd C:\Users\Tadeo\Workspace
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Configuraci�n personal
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Agrego seg�n lo que necesito
execute pathogen#infect()
filetype plugin indent on
syntax on
set laststatus=2
"Datos de la barra de estado
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
colorscheme molokai
set guifont=Consolas:h11
set encoding=utf-8
set fileencoding=utf-8
set nu
set hidden
set ignorecase
set incsearch
set smartcase
set showmatch
set autoindent
set ruler
set viminfo+=n$VIM/_viminfo
set noerrorbells
set showcmd
set mouse=a
"Cantidad de comandos a recordar
set history=1000
set undolevels=1000
set novisualbell
set t_vb=
set tm=500
"Muestra en la barra el estado en el que estamos
set showmode
"Cambia al directorio del archivo abierto
set autochdir
"Odio los archivos swap
set nobackup
set nowb
set noswapfile
"cuando un archivo cambia con otro editor lo carga utom�ticamente
set autoread
"hacer m�s cosas con leader-key
let mapleader = ","
let g:mapleader = ","
"guardado r�pido ,+w
nmap <leader>w :w!<cr>	
"Mejorar la linea de comandos
set wildmenu
set mouse=a
"al presionar dos veces j pasa la modo normal
imap jj <esc>
"quita el resaltado de las b�squedas con Ctrl+l
nnoremap <C-L> :nohl<cr><C-L>
"No cierra la ventaba al borrar un buffer
" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Configuraci�n GUI
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set guioptions-=T "quita la barra de herramientas
set guioptions-=r "quita la barra de desplazamiento derecha
set go-=L "quita la barra de desplazamiento izquierda

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Configuraci�n de plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"NerdTree
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
map <C-b> :NERDTreeToggle<CR>
