""""""""""""""""""""""""""""""""
"
" PACKAGE MANAGEMENT
"
""""""""""""""""""""""""""""""""
" not a vi
set encoding=utf-8

let g:ale_disable_lsp = 1
" start vundler
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()

" core plugins
Bundle "gmarik/vundle"
Bundle "flazz/vim-colorschemes"
Bundle "ctrlpvim/ctrlp.vim"

" nice to have plugins
Bundle "jiangmiao/auto-pairs"
Bundle "tmhedberg/SimpylFold"
Bundle "tpope/vim-commentary"
Bundle "bling/vim-airline"
Bundle "vim-airline/vim-airline-themes"
Bundle "vim-syntastic/syntastic"

" togglable panels
Bundle "scrooloose/nerdtree"

" python
Bundle "numirias/semshi"
Bundle "Vimjas/vim-python-pep8-indent"
Bundle "dense-analysis/ale"
Bundle "neoclide/coc.nvim"
Bundle "neoclide/coc-python"
Bundle "junegunn/fzf.vim"
Bundle "jeetsukumaran/vim-pythonsense"
Bundle "python-mode/python-mode"

" Other languages
Bundle "rodjek/vim-puppet"
Bundle "groovy.vim"
Bundle "bash-support.vim"
Bundle "hashivim/vim-terraform"
Bundle "juliosueiras/vim-terraform-completion"

" enable all the plugins
filetype plugin indent on

""""""""""""""""""""""""""""""""
"
" SETTINGS & KEYBINDINGS
"
""""""""""""""""""""""""""""""""
set smarttab
set ruler
set hidden
set ignorecase
set smartcase
set showmatch
set incsearch
set hls
set number
set ls=2
set cursorline
set nowrap
set backspace=indent,eol,start
set shell=/bin/bash
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set copyindent

set completeopt -=preview
" set textwidth=100
set wildmenu
set noshowmode
set cmdheight=1
set nofoldenable
" set autoread

" backup/persistance settings
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
set backup
set writebackup
set noswapfile

" persist (g)undo tree between sessions
set undofile
set history=100
set undolevels=100

" set <leader>
let mapleader=","

let g:loaded_python_provider = 0

" enable mouse
set mouse=a

" show trailing whitespaces
set list
set listchars=tab:·\ ,trail:¬,nbsp:.,extends:❯,precedes:❮
augroup ListChars2
    au!
    autocmd filetype go set listchars+=tab:\ \ 
    autocmd ColorScheme * hi! link SpecialKey Normal
augroup END

" syntax highlighting
syntax on
colorscheme candyman
highlight CursorLine ctermbg=black

" NEW
" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1

" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
" NEW
" session management
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" togglables without FN keys
nnoremap <leader>1 :NERDTreeToggle %<CR>
set pastetoggle=<leader>2
nnoremap <leader>3 :set number!<CR>
nnoremap <leader>4 :set rnu!<CR>
nnoremap <leader>5 :GundoToggle<CR>

" visual reselect of just pasted
nnoremap gp `[v`]

"make enter break and do newlines
nnoremap <CR> i<CR><Esc>==
" nnoremap <CR> O<Esc>j
nnoremap <leader>j i<CR><Esc>==

"make space in normal mode add space
"nnoremap <Space> i<Space><Esc>l

" better scrolling
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" consistent menu navigation
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" intellij style autocomplete shortcut
inoremap <C-@> <C-x><C-o>
inoremap <C-Space> <C-x><C-o>

" ctrlP config
let g:ctrlp_map = "<c-p>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

let s:ctrlp_fallback = 'ag %s
  \ --nocolor --nogroup --depth 5
  \ --hidden --follow --smart-case
  \ --ignore .git
  \ --ignore .cargo
  \ --ignore .ropeproject
  \ --ignore .ccache
  \ --ignore .DS_Store
  \ --ignore .opt1
  \ --ignore .pylint.d
  \ --ignore .shell
  \ --ignore "build/*"
  \ --ignore "dist/*"
  \ --ignore "target/*"
  \ --ignore "**/*.pyc"
  \ --ignore "**/*.class"
  \ --ignore "**/*.o"
  \ -g ""'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard', s:ctrlp_fallback]


" easy motion rebinded
nmap <leader>f <Plug>(easymotion-f2)
nmap <leader>F <Plug>(easymotion-F2)

" open vimrc
nnoremap <leader>v :e  ~/.config/nvim/init.vim<CR>
nnoremap <leader>V :tabnew  ~/.config/nvim/init.vim<CR>

" reload all open buffers
nnoremap <leader>Ra :tabdo exec "windo e!"
" ctrlP config
let g:ctrlp_map = "<c-p><CR>"
nnoremap <leader>t :CtrlPMRU<CR>
nnoremap <leader>bp :CtrlPBuffer<CR>

let s:ctrlp_fallback = 'ag %s
  \ --nocolor --nogroup --depth 5
  \ --hidden --follow --smart-case
  \ --ignore .git
  \ --ignore .cargo
  \ --ignore .ropeproject
  \ --ignore .ccache
  \ --ignore .DS_Store
  \ --ignore .opt1
  \ --ignore .pylint.d
  \ --ignore .shell
  \ --ignore "build/*"
  \ --ignore "dist/*"
  \ --ignore "target/*"
  \ --ignore "**/*.pyc"
  \ --ignore "**/*.class"
  \ --ignore "**/*.o"
  \ -g ""'

let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . --cached --others --exclude-standard', s:ctrlp_fallback]

"map next-previous jumps
nnoremap <leader>m <C-o>
nnoremap <leader>. <C-i>

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Use sane regexes
nnoremap <leader>/ /\v
vnoremap <leader>/ /\v

" Use :Subvert search
nnoremap <leader>// :S /
vnoremap <leader>// :S /

" Use regular replace
nnoremap <leader>s :%s /
vnoremap <leader>s :%s /

" Use :Subvert replace
nnoremap <leader>S :%S /
vnoremap <leader>S :%S /

" clever-f prompt
let g:clever_f_show_prompt = 1
let g:clever_f_across_no_line = 1

" syntastic
"let g:syntastic_python_checkers = []

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
let g:airline#extensions#ale#enabled = 1

" YouCompleteMe
" let g:ycm_path_to_python_interpreter = '/usr/local/bin/python3'
let g:ycm_filetype_blacklist = {}
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_key_invoke_completion = "<C-j>"
let g:ycm_collect_identifiers_from_tags_files = 1

let g:vim_action_ag_escape_chars = '#%.^$*+?()[{\\|'

" reload ctags

" git and ack stuff
let g:gitgutter_enabled = 1
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0
nnoremap <leader>g :Git 
nnoremap <leader>a :Ag! 

""""""""""""""""""""""""""""""""
"
" PROGRAMMING LANGUAGES
"
""""""""""""""""""""""""""""""""
" vim-go settings
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

" vim-go bindings
augroup FileType go
  au!
  au FileType go nmap gd <Plug>(go-def)
  au FileType go nmap <Leader>dd <Plug>(go-def-vertical)

  au FileType go nmap <Leader>dv <Plug>(go-doc-vertical)
  au FileType go nmap <Leader>db <Plug>(go-doc-browser)

  au FileType go nmap <Leader>i <Plug>(go-info)

  au FileType go nmap <leader>r <Plug>(go-run)
  au FileType go nmap <leader>b <Plug>(go-build)
  au FileType go nmap <leader>t <Plug>(go-test)
augroup END

" Python Settings
let g:pymode_rope = 0
let ropevim_enable_shortcuts = 1
let g:pymode_rope_lookup_project = 0 "dont scan parent dir for .ropeproject
let g:pymode_rope_goto_def_newwin = "e"
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0
set cmdheight=2
set updatetime=300
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <silent><expr> <c-space> coc#refresh()
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:ale_sign_column_always = 1

" Puppet
let g:puppet_align_hashes = 1

" airline
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1

" Pymode Options
let g:pymode_python = 'python3'
let g:pymode_options_max_line_length = 100
let g:pymode_options_colorcolumn = 0
let g:pymode_folding = 0        " Turn off code folding
let g:pymode_virtualenv = 1     " Auto fix vim python paths if virtualenv enabled
let g:pymode_motion = 1         " Enable python objects and motion
let g:pymode_trim_whitespaces = 1 "Trim unused white spaces on save
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 5
let g:ale_linters = {
      \   'python': ['flake8', 'pylint'],
      \   'ruby': ['standardrb', 'rubocop'],
      \   'javascript': ['eslint'],
      \}
let g:ale_fixers = {
      \    'python': ['yapf'],
      \}

nmap <F9> :ALEFix<CR>
let g:ale_fix_on_save = 1
function! LinterStatus() abort
  let l:counts = ale#statusline#Count(bufnr(''))

  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors

  return l:counts.total == 0 ? '✨ all good ✨' : printf(
        \   '😞 %dW %dE',
        \   all_non_errors,
        \   all_errors
        \)
endfunction

nmap <silent> gd <Plug>(coc-definition)
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
nmap <leader>rn <Plug>(coc-rename)

set statusline=
set statusline+=%m
set statusline+=\ %f
set statusline+=%=
set statusline+=\ %{LinterStatus()}

" debugging
let g:pymode_breakpoint = 1

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
let g:pymode_indent = 1

" linting
let g:pymode_lint = 0
let g:pymode_lint_cwindow = 0
let g:pymode_lint_message = 1
let g:pymode_lint_on_write = 1
let g:pymode_lint_unmodified = 0
let g:pymode_lint_on_fly = 1
let g:pymode_lint_checkers = ['pyflakes', 'pep8'] " 'mccabe']
let g:pymode_lint_signs = 1

"let g:pymode_lint_ignore = "E501,W"
let g:pymode_lint_sort = ['E','C']

" configure nvim -> ipython integration
let g:slime_target = "tmux"
" assume vim is on left and ipython on right
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

" fix paste issues in ipython
"let g:slime_python_ipython = 1

" Use '##' to define cells instead of using marks
let g:ipython_cell_delimit_cells_by = 'tags'
" Rstudio/ipython habit
autocmd FileType python nnoremap <buffer> <leader>w :IPythonCellRunTime<CR>
autocmd FileType python nnoremap <buffer> <leader>c :IPythonCellExecuteCellJump<CR>
" autocmd FileType python nnoremap <buffer> <C-j> :IPythonCellNextCell<CR>
" autocmd FileType python nnoremap <buffer> <C-k> :IPythonCellPrevCell<CR>
autocmd FileType python nnoremap <buffer> <leader>x :IPythonCellRestart<CR>

" R indentation
augroup r_indent
  autocmd!
  autocmd FileType r set autoindent
  autocmd FileType r set textwidth=80 shiftwidth=2
  autocmd FileType r set softtabstop=2 tabstop=2
augroup END

" Nvim-R config
let R_assign = 0
let R_args = ['--no-save', '--no-restore', '--quiet']
" https://www.visidata.org/
" let R_csv_app = 'terminal:vd'
let R_csv_app = 'tmux new-window vd'
" let R_after_start = ['options(help_type = "html")']
" autocmd FileType r nmap <silent> <LocalLeader>rt :call RAction('glimpse')<CR>
autocmd FileType r nnoremap <buffer> <CR> <Plug>(RDSendLine)


" General file runners for various languages
function! LangRunner()
  if(&ft=="python")
    nnoremap <leader>R :!python3 %<cr>
  elseif(&ft=="r")
    nnoremap <leader>R :!R --no-save --no-restore < %<cr>
  elseif(&ft=="haskell")
    nnoremap <leader>R :!ghci %<cr>
  elseif(&ft=="hy")
    nnoremap <leader>R :!hy %<cr>
  elseif(&ft=="clojure")
    nnoremap <leader>R :!lein run<cr>
  elseif(&ft=="javascript")
    nnoremap <leader>R :!node %<cr>
  elseif(&ft=="c")
    nnoremap <leader>R :!make run<cr>
  endif
endfunction

au BufEnter * call LangRunner()

" " json syntax handling in conjunction with vim-json plugin
" augroup json_autocmd
"   autocmd!
"   autocmd FileType json set autoindent
"   autocmd FileType json set formatoptions=tcq2l
"   autocmd FileType json set textwidth=78 shiftwidth=2
"   autocmd FileType json set softtabstop=2 tabstop=8
"   autocmd FileType json set expandtab
"   autocmd FileType json set foldmethod=syntax
" augroup END

""""""""""""""""""""""""""""""""
"
" COOL HACKS
"
""""""""""""""""""""""""""""""""
" Make sure Vim returns to the same line when you reopen a file.
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" Text Highlighter = <leader>h[1-4]
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

nnoremap <leader>hh :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>h1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>h2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>h3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>h4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>h5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>h6 :call HiInterestingWord(6)<cr>

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

highlight search ctermfg=white ctermbg=3423513

" better retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <leader>n :bprevious<CR>
nnoremap <leader>m :bnext<CR>

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

let python_highlight_all=1
""""""""""""""""""""""""""""""""
"
" BUG WORKAROUNDS
"
""""""""""""""""""""""""""""""""
" realign buffers when iterm goes fullscreen
augroup FixProportionsOnResize
  au!
  au VimResized * exe "normal! \<c-w>="
augroup END

" vim mode-switch lag fix
if ! has("gui_running")
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" make C-a, C-x work properly
set nrformats=

" make C-j work consistent in C programms
let g:C_Ctrl_j='off'

" potential lag fix
let g:matchparen_insert_timeout=1

" fix bufexplorer bug with hidden
let g:bufExplorerFindActive=0

" alternative approach for lines that are too long
set colorcolumn=
" highlight OverLength ctermbg=gray ctermfg=white guibg=#999999
" match OverLength /\%81v.\+/
