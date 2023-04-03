call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-tree/nvim-web-devicons'
Plug 'github/copilot.vim'
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'dense-analysis/ale'

call plug#end()

" NERDTree
" Map Ctrl-t to toggle NERDTree
map <C-t> :NERDTreeToggle<CR>

" Material Theme
" Set theme style: 'darker', 'lighter', 'palenight', 'oceanic', 'deep ocean'
let g:material_style = 'darker'

" Load the colorscheme
colorscheme material

" ALE
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_fix_on_save = 1
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_enabled = 1

" Telescope
" Map Ctrl-p to open Telescope
nnoremap <C-p> :lua require('telescope.builtin').find_files({ search_dirs = { vim.fn.expand('%:p:h') } })<CR>

" Vim Airline
let g:airline_theme='deus'
let g:airline#extensions#tabline#enabled = 1
" Either 'default', 'jsformatter', 'unique_tail' or 'unique_tail_improved'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#ale#enabled = 1
