call plug#begin('~/.local/share/nvim/plugged')
Plug 'dracula/vim'
Plug 'jacoborus/tender.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'neomake/neomake'
Plug 'universal-ctags/ctags'
Plug 'chriskempson/base16-vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'vim-syntastic/syntastic'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'scrooloose/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': '.install --all' }
Plug 'junegunn/fzf.vim'

Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'ianks/vim-tsx'
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'maxmellon/vim-jsx-pretty'

Plug 'burnettk/vim-angular'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'HerringtonDarkholme/vim-worksheet'
Plug 'dyng/ctrlsf.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'LnL7/vim-nix'

if has('nvim')
  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  " Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
" text appearance
set textwidth=120
set nowrap                          " nowrap by default
set list                            " show invisible characters
set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace
set updatetime=300
set signcolumn=yes
"FZF

let $FZF_DEFAULT_COMMAND = 'fd --type f --hidden --follow --color=always -E .git --ignore-file .gitignore'
let $FZF_DEFAULT_OPTS='--ansi --layout=reverse'
let g:fzf_files_options = '--preview "(bat --color \"always\" --line-range 0:100 {} || head -'.&lines.' {})"'

autocmd! FileType fzf
autocmd  FileType fzf set noshowmode noruler nonu

" Initialize plugin system
" let g:deoplete#sources={} 
" let g:deoplete#sources._=['buffer', 'member', 'tag', 'file', 'omni', 'ultisnips']
" let g:deoplete#omni#input_patterns={} 
" let g:deoplete#omni#input_patterns.scala='[^. *\t]\.\w*'
" let g:deoplete#omni_patterns = {}

" let g:deoplete#omni_patterns.terraform = '[^ *\t"{=$]\w*'
" let g:deoplete#enable_at_startup = 1

call plug#end()
" call deoplete#initialize()

filetype plugin on
set encoding=utf-8
set viewoptions=folds,options,cursor,unix,slash
set signcolumn=yes
au BufRead,BufNewFile *.sbt set filetype=scala

let base16colorspace=256
" Use deoplete
" fuzzy finder with ctrl-p
nnoremap <C-p> :Files<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' } 

"Typescript
"autocmd FileType html,css,scss,jsx,tsx EmmetInstall
autocmd FileType json syntax match Comment +\/\/.\+$+
"autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
command! -nargs=0 Prettier :CocCommand prettier.formatFile


let g:tsuquyomi_completion_detail = 1
let g:user_emmet_install_global=0
let g:user_emmet_leader_keky='<C-y>'
" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1
let g:NERDTreeIgnore = [
      \ '\.vim$',
      \ '\~$',
      \ '\.beam',
      \ 'elm-stuff',
      \ 'deps',
      \ '_build',
      \ '.git',
      \ 'node_modules',
      \ 'tags',
      \ 'target',
      \ ]

map <C-n> :NERDTreeToggle<CR>
"map <C-F> :NERDTreeFind<CR>
" easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

if(has('termguicolors'))
  set termguicolors
endif

syntax on
colorscheme dracula
set backspace=2
set shell=/bin/bash
set laststatus=2
set noshowmode

"highlight Pmenu guibg=white guifg=black gui=bold
"highlight Comment gui=bold
"highlight Normal gui=bold
"highlight NonText guibg=none
" Transparent Background (For i3 and compton)
"highlight Normal guibg=NONE ctermbg=NONE
"highlight LineNr guibg=NONE ctermbg=NONE
set number

let g:airline_powerline_fonts=1
let g:airline_solarized_bg='dark'
" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

" gitgutter
let g:gitgutter_enabled=1
let g:gitgutter_realtime=1
" Turn off Scrolling
set mouse=a
nmap <ScrollWheelUp> <nop>
nmap <S-ScrollWheelUp> <nop>
nmap <C-ScrollWheelUp> <nop>
nmap <ScrollWheelDown> <nop>
nmap <S-ScrollWheelDown> <nop>
nmap <C-ScrollWheelDown> <nop>
nmap <ScrollWheelLeft> <nop>
nmap <S-ScrollWheelLeft> <nop>
nmap <C-ScrollWheelLeft> <nop>
nmap <ScrollWheelRight> <nop>
nmap <S-ScrollWheelRight> <nop>
nmap <C-ScrollWheelRight> <nop>

"
"CrtlSF Mapping
nmap <C-F>f <Plug>CtrlSFPrompt
vmap <C-F>f <Plug>CtrlSFVwordPath
vmap <C-F>F <Plug>CtrlSFVwordExec
nmap <C-F>n <Plug>CtrlSFCwordPath
nmap <C-F>p <Plug>CtrlSFPwordPath
"" Spaces & Tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set copyindent

" Terraform settings
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_fmt_on_save=1

"Markdown settings
let g:mkdp_auto_start = 0
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_fenced_languages = ['c++=cpp', 'scala=scala']


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
inoremap <silent><expr> <c-space> coc#refresh()
" Better display for messages
set cmdheight=2
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
command! -nargs=0 MetalsDoctor :call CocRequestAsync('metals', 'workspace/executeCommand', { 'command': 'doctor-run' })
let g:coc_node_path = "/Users/bubu/.nvm/versions/node/v11.10.1/bin/node"
