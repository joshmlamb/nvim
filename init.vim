let g:dashboard_custom_header = [
    \'',
    \'',
    \'',
    \'',
    \'',
    \'',
    \' ________  _______  _________        _________  ________          ___       __   ________  ________  ___  __        ',
    \'|\   ____\|\  ___ \|\___   ___\     |\___   ___\\   __  \        |\  \     |\  \|\   __  \|\   __  \|\  \|\  \      ',
    \'\ \  \___|\ \   __/\|___ \  \_|     \|___ \  \_\ \  \|\  \       \ \  \    \ \  \ \  \|\  \ \  \|\  \ \  \/  /|_    ',
    \' \ \  \  __\ \  \_|/__  \ \  \           \ \  \ \ \  \\\  \       \ \  \  __\ \  \ \  \\\  \ \   _  _\ \   ___  \   ',
    \'  \ \  \|\  \ \  \_|\ \  \ \  \           \ \  \ \ \  \\\  \       \ \  \|\__\_\  \ \  \\\  \ \  \\  \\ \  \\ \  \  ',
    \'   \ \_______\ \_______\  \ \__\           \ \__\ \ \_______\       \ \____________\ \_______\ \__\\ _\\ \__\\ \__\ ',
    \'    \|_______|\|_______|   \|__|            \|__|  \|_______|        \|____________|\|_______|\|__|\|__|\|__| \|__| ',
    \'',
    \'',
    \'',
    \'',
    \'',
    \'',
\]
let g:dashboard_custom_section={
\   '1': {
\      'description': ['  Find Files                                    SPC f'],
\      'command': 'Files'
\   },
\   '2': {
\      'description': ['  Search Project                              SPC s p'],
\      'command': 'Rg'
\   },
\   '3': {
\      'description': ['פּ  Explore                                       SPC e'],
\      'command': 'call ToggleNetrw()'
\   },
\   '4': {
\      'description': ['ﮮ  Update Plugins                              SPC p u'],
\      'command': 'PlugUpdate'
\   },
\   '5': {
\      'description': ['  Edit Config                                 SPC c e'],
\      'command': 'e ~/.config/nvim/init.vim'
\   },
\}
let g:dashboard_default_executive = 'fzf'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
let g:comment_strings = {
\    'sh': ['# '],
\    'zsh': ['# '],
\    'vim': ['" '],
\    'html': ['<!--', '-->'],
\    'vue': ['//', '<!--', '-->'],
\    'css': ['/*', '*/'],
\    'scss': ['/*', '*/'],
\    'javascript': ['//', '{/*', '*/}'],
\    'liquid': ['{% comment %}', '{% endcomment %}'],
\    'twig': ['{#', '#}'],
\    'blade': ['{{--', '--}}'],
\}
let g:polyglot_disabled = ['autoindent', 'sensible']
let g:coc_global_extensions = ['coc-css', 'coc-emmet', 'coc-html', 'coc-json', 'coc-snippets', 'coc-svelte', 'coc-tailwindcss', 'coc-tsserver', 'coc-vimlsp', 'coc-vetur', 'coc-yaml']
let mapleader = " "


call plug#begin('~/.config/nvim/plugins')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'glepnir/dashboard-nvim'
    Plug 'mhinz/vim-signify'
    Plug 'sheerun/vim-polyglot'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    Plug 'mattn/emmet-vim'
    Plug 'unblevable/quick-scope'
    Plug 'tpope/vim-surround'
call plug#end()


colorscheme tokyonight
set clipboard+=unnamed
set path+=**
set wildignore+=**/node_modules/**,**/.git/**
set mouse=a
set relativenumber number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set scrolloff=8
set colorcolumn=80
set nobackup
set nowb
set noswapfile
set completeopt+=menu,menuone,noinsert,noselect

if executable("fzf")
    set rtp+=~/.fzf
endif

if executable("rg")
    set grepprg=rg\ --vimgrep\ --no-heading
endif


" Maps
nnoremap <leader>ce :e ~/.config/nvim/init.vim<CR>
nnoremap <leader>cr :source ~/.config/nvim/init.vim<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>
nnoremap <leader>h :help<space>
nnoremap <leader>cl :setlocal cursorcolumn! cursorline!<CR>
nnoremap <CR> :noh<CR><CR>
"noremap <up> <nop>
"noremap <down> <nop>
"noremap <left> <nop>
"noremap <right> <nop>

if executable("fzf")
    nnoremap <leader>f :GFiles<CR>
    nnoremap <leader>af :Files<CR>
    nnoremap <leader>b :Buffers<CR>
else
    nnoremap <leader>f :find<space>
    nnoremap <leader>b :call setqflist(getbufinfo({'buflisted':1})) \| copen<CR>
endif

if executable("rg")
    nnoremap <leader>sp :Rg<CR>
else
    nnoremap <leader>sp :grep<space>
endif

nnoremap <leader>cb :bd<CR>
nnoremap <leader>cB :%bd\|e#\|bd#<CR>

inoremap <silent><expr> <TAB>
\   pumvisible() ? "\<C-n>" :
\   <SID>check_back_space() ? "\<TAB>" :
\   coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nnoremap Y y$
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
inoremap <C-j> <esc>:m .+1<CR>==
inoremap <C-k> <esc>:m .-2<CR>==
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==

inoremap {<CR> {<CR>}<esc>O
inoremap { {}<esc>i
inoremap {{ {{  }}<esc>2hi
inoremap {% {%  %}<esc>2hi
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i


" Toggle File Explorer
function ToggleNetrw()
    if exists("g:netrw_buffer") && bufexists(g:netrw_buffer)
        exe "bd".g:netrw_buffer | unlet g:netrw_buffer
    else
        Vexplore | let g:netrw_buffer=bufnr("%")
    endif
endfunction
nnoremap <leader>e :call ToggleNetrw()<CR>


" Comment Helper
function CommentUtil(line, show_alternate) abort
    let comment_strings = g:comment_strings[&filetype]
    let comment_list_length = len(comment_strings)
    let line = trim(a:line)

    if a:show_alternate && comment_list_length == 3
        let comment_strings = comment_strings[1:2]
        let comment_list_length = 2
    elseif comment_list_length == 3 
        let comment_strings = comment_strings[0:0]
        let comment_list_length = 1
    endif

    let is_commented = line[0:strlen(comment_strings[0]) - 1] == comment_strings[0]

    return {
    \   'comment_strings': comment_strings,
    \   'comment_list_length': comment_list_length,
    \   'is_commented': is_commented,
    \}
endfunction

function CommentLine(...) abort
    set paste
    let line = getline('.')
    let utils = CommentUtil(line, get(a:, 1, 0)) 

    if utils['is_commented']
        exe "normal ^" . strlen(utils['comment_strings'][0]) . "x"

        if utils['comment_list_length'] == 2
            exe "normal $" . (strlen(utils['comment_strings'][1]) - 1) . "h" . strlen(utils['comment_strings'][1]) . "x"
        endif
    else
        if utils['comment_list_length'] == 1
            exe "normal I" . utils['comment_strings'][0] . "\<esc>^"
        elseif utils['comment_list_length'] == 2
            exe "normal I" . utils['comment_strings'][0] . "\<esc>A" . utils['comment_strings'][1] . "\<esc>^"
        endif
    endif

    set nopaste
endfunction

function CommentSelection(...) abort range
    set paste
    let line = getline("'<")
    let utils = CommentUtil(line, get(a:, 1, 0)) 

    if utils['comment_list_length'] == 1
        for l:line in range(line("'<"), line("'>"))
            exe "normal " . l:line . "gg"
            call CommentLine()
        endfor
    elseif utils['comment_list_length'] == 2
        if utils['is_commented']
            exe line("'<")."normal dd" | exe line("'>")."normal dd"
        else
            exe line("'<")."normal O". utils['comment_strings'][0] | exe line("'>")."normal o". utils['comment_strings'][1]
        endif
    endif

    set nopaste
endfunction
noremap <leader>/ :call CommentLine()<CR>
vnoremap <leader>/ :call CommentSelection()<CR>
noremap <leader>? :call CommentLine(1)<CR>
vnoremap <leader>? :call CommentSelection(1)<CR>


" Toggle Quickfix lList
function ToggleQuickfix()
    let quickfix_state = len(filter(getwininfo(), 'v:val.quickfix && !v:val.loclist'))

    if quickfix_state == 0 
        copen
    else
        cclose
    endif
endfunction
nnoremap <silent> <leader>q :call ToggleQuickfix()<CR>
