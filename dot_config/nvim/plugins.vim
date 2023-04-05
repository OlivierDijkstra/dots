call plug#begin(stdpath('data') . '/plugged')

Plug 'nvim-lua/plenary.nvim' " Common utilities for Neovim plugins
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }

" LSP, Completion and linting / formatting
Plug 'neovim/nvim-lspconfig' " LSP configuration
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp' " Autocompletion
Plug 'onsails/lspkind-nvim'
Plug 'jose-elias-alvarez/null-ls.nvim' " Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
Plug 'williamboman/mason.nvim' " Additional LSP support for specific libraries
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'glepnir/lspsaga.nvim'

" UI
Plug 'preservim/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim'

" Theme
Plug 'marko-cerovac/material.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
Plug 'nvim-telescope/telescope-file-browser.nvim'

" Utilities
Plug 'github/copilot.vim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'
Plug 'numToStr/Comment.nvim'

call plug#end()

source $HOME/.config/nvim/plugins/material.vim
source $HOME/.config/nvim/plugins/treesitter.vim
source $HOME/.config/nvim/plugins/cmp.vim
source $HOME/.config/nvim/plugins/lsp.vim
source $HOME/.config/nvim/plugins/lspkind.vim
source $HOME/.config/nvim/plugins/lspsaga.vim

" UI Configuration
lua << EOF
require('telescope').setup({
				extensions = {
								file_browser = {
								},
				},
})

require('telescope').load_extension('file_browser')

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
		lualine_b = {'branch'},
		lualine_c = {
			{
        'diagnostics',
				sources = {'nvim_lsp'},
				sections = {'error', 'warn', 'info', 'hint'},
				symbols = {error = ' ', warn = ' ', info = ' ', hint = ' '},
				colored = true,
				-- always_visible = true,
      }
    },
		lualine_x = {'filetype'},
		lualine_y = {'progress'},
		lualine_z = {'location'}
	},
  extensions = {}
}

require('bufferline').setup({
  options = {
    diagnostics = "nvim_lsp"
  } 
})

EOF

" Utilities Configuration
lua << EOF
require('nvim-ts-autotag').setup()
require('nvim-autopairs').setup()
require('Comment').setup({
				toggler = {
								line = '<leader>/',
				},
				opleader = {
								line= '<leader>/'
				}
})
EOF
