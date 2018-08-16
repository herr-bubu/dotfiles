" - VIM PLUG
call plug#begin('~/.local/share/nvim/plugged')
Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'cloudhead/neovim-fuzzy'
Plug 'neomake/neomake'
Plug 'universal-ctags/ctags'
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'

"Code completion with Deoplete - enabled by ensime
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup=1
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" Initialize plugin system
"let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
call plug#end()
let g:deoplete#omni#input_patterns={} 
" Ensime

:let EnErrorStyle='Underlined'

autocmd BufWritePost *.scala silent :EnTypeCheck
au FileType scala nnoremap <localleader>df :EnDeclaration<CR>
"au BufRead,BufNewFile *.sbt      set filetype=scala

let base16colorspace=256
" Use deoplete
" fuzzy finder with ctrl-p
nnoremap <C-p> :FuzzyOpen<CR>
" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Regenerate tags file
nnoremap <C-u> :!ctags -R -f ./tags/ .<CR>

set tags=./tags;/
set number

"Linting with neomake
let g:neomake_sbt_maker = {
      \ 'exe': 'sbt',
      \ 'args': ['-Dsbt.log.noformat=true', 'compile'],
      \ 'append_file': 0,
      \ 'auto_enabled': 1,
      \ 'output_stream': 'stdout',
      \ 'errorformat':
          \ '%E[%trror]\ %f:%l:\ %m,' .
            \ '%-Z[error]\ %p^,' .
            \ '%-C%.%#,' .
            \ '%-G%.%#'
     \ }
let g:neomake_enabled_makers = ['sbt']
let g:neomake_verbose=3

let g:airline_powerline_fonts=1
let g:airline_solarized_bg='dark'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" gitgutter
let g:gitgutter_enabled=1

" Spaces & Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

" Terraform settings
let g:terraform_align=1
let g:terraform_fold_sections=1


" Neomake on text change
autocmd InsertLeave,TextChanged * update | Neomake! sbt
