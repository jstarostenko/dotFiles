set nocompatible              " Vundle setup
filetype plugin indent on    " Vundle setup

set encoding=utf8
set nobackup
set nowritebackup
set noswapfile
set visualbell
set ruler                  " Show cursor position at all times
set showcmd                " Display incomplete commands
set laststatus=2           " Always display the status line
set autowrite              " Automatically write before running commands
set clipboard=unnamed      " Share the clipboard with OS
set autoindent             " Copy indent from current line
set wildmenu               " Enhanced completion in command-line
set wildmode=list:longest  " When more than one match, list all matches and complete till longest common string
set backspace=2            " Backspace deletes like most programs in insert mode
set nojoinspaces           " Use one space, not two, after punctuation.
set showmatch              " When a bracket is inserted, briefly jump to matching one
set textwidth=80           " Break long strings into multiple lines
set so=15                  " Don't hide buffer after pasting content
let g:netrw_liststyle=3    " Set default style of file explorer
let g:netrw_dirhistmax = 0 " Don't save history of network writes

" Softtabs tabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Tame searching / moving
set ignorecase
set smartcase
set incsearch
set hlsearch

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Color scheme settings.
syntax on
colorscheme base16-tomorrow
set background=dark

" Spell settings
set spellfile=~/.vim/spell/mySpellFile.en.utf-8.add

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Turbux config
if filereadable("Gemfile")
  let g:turbux_command_prefix = 'bundle exec'
endif

" hack to fix broken 'run focused test' since https://github.com/jgdavey/vim-turbux/pull/36
let g:turbux_test_type = ''

" Airline config
let g:airline_theme='tomorrow'
let g:airline_powerline_fonts = 1

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Rename current file
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    exec ':bd ' . old_name
    redraw!
  endif
endfunction

map <leader>, :call RenameFile()<cr>

map <leader>e :call RunFile(expand("%"))<cr>

" Toggle - comment, uses Vim-commentary
nmap <C-\> gcc<ESC>
vmap <C-\> gcc<ESC>

" Replace t with tabnew in console
ca t tabnew

" %% gives you the current directory
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Rails debug helper
nnoremap <leader>o oputs "#" * 90<c-m>Rails.logger.debug("DEBUG: ")<c-m>puts "#" * 90<esc>

" Browse open buffers
nmap <leader>b :CtrlPBuffer<CR>
nmap <leader>f :CtrlP<CR>

"Have leader D just delete the line
nmap <leader>d "_d

" Make Y behave like other capitals
map Y y$
