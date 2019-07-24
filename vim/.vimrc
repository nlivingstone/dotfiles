set nocompatible              " be iMproved, required

so ~/.vim/plugins.vim

set backspace=indent,eol,start
let mapleader = ','						"Set leader key
set number							"Display line numbers
set encoding=UTF-8
 
"--------------Visuals-------------------"
syntax enable							"Enable syntax highlighting
set t_CO=256
colorscheme atom-dark
set guifont=Operator_Mono_Lig:h13			
set macligatures						"Use ligatures in MacVim
highlight comment gui=italic					"Enable italic comments
set linespace=15						"MacVim Specific
set showtabline=2						"Always show tab line

highlight LineNR guibg=bg
hi foldcolumn guibg=bg

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

"/
"/ Text Formatting
"/

set textwidth=0 
set wrapmargin=0
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"/
"/ Search
"/
set hlsearch
set incsearch

"--------------Plugins-------------------"

"/
"/ LightLine (https://github.com/itchyny/lightline.vim)
"/
let g:lightline = {
      \ 'colorscheme': 'one',
      \ }

"/
"/ CtrlP
"/
" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|.swp'
let g:ctrlp_match_window = 'top_order:ttb,min:1,max:5,results:5'
let g:ctrlp_show_hidden = 1
let g:ctrlp_prompt_mappings = {
  \ 'AcceptSelection("e")': [],
  \ 'AcceptSelection("t")': ['<cr>', '<c-m>'],
  \ }

"/
"/ NERDTree
"/
let NERDTreeHijackNetrw = 0
let NERDTreeMapOpenInTab='<ENTER>'
let NERDTreeShowHidden=1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

"/
"/ vim-php-namespace
"/
function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
"Automatically add use statements
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<cr>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<cr>

"/
"/ php-cs-fixer
"/
" If php-cs-fixer is in $PATH, you don't need to define line below
let g:php_cs_fixer_path = $HOME."/.composer/vendor/bin/php-cs-fixer" 				" define the path to the php-cs-fixer.phar
let g:php_cs_fixer_rules = "@PSR2"          									" options: --rules (default:@PSR2)
autocmd BufWritePost *.php silent! call PhpCsFixerFixFile()
nnoremap <Leader>pf :call PhpCsFixerFixFile()<cr>

"/
"/ pdv
"/
let g:pdv_template_dir = $HOME."/.vim/bundle/pdv/templates_snip"
nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

"/
"/ NERDCommenter
"/
nmap <D-/> :call NERDComment(0,"toggle")<cr>
vmap <D-/> :call NERDComment(0,"toggle")<cr>
let g:NERDSpaceDelims = 2

"/
"/ Misc. Mappings
"/
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap <Leader>ep :tabedit ~/.vim/plugins.vim<cr>
nmap <Leader>es :tabedit ~/.vim/snippets/
nmap <Leader><esc> :nohlsearch<cr>
nmap <C-b> :NERDTreeToggle<cr>
nmap <C-t> :CtrlPBufTag<cr>
nmap <C-r> :CtrlPMRUFiles<cr>

"/
"/ Emmet
"/
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"--------------Auto-Commands-------------------"
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup end



"/
"/ Notes & Reminders
"/

" PHP Specific
" <Leader> + d                                          Create docblock when cursor is over a method
" <Leader> + pf                                         Format PHP to PSR2
" <Leader> + u                                          Insert use statement for fucntion under cursor 

" <Ctrl> + b                                            Toggle NERDTree
" <Ctrl> + p                                            Open CtrlP Drawer
" <Leader> + ev                                         Edit .vimrc
" <Leader> + ep                                         Edit plugins
" <Leader> + es                                         Edit snippets
" <Leader> + <Esc>                                      Disable search highlighting

