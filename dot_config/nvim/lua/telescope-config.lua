local telescope = require('telescope')

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--hidden',      -- This line makes the search include hidden files.
      '--ignore-case', -- This line makes the search case-insensitive.
    },
    file_ignore_patterns = { ".git/*" },
    prompt_prefix = '🔎 ',
    layout_strategy = 'flex',
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    find_files = {
      theme = 'dropdown',
      hidden = true,
    },
    live_grep = {
      theme = 'dropdown',
    },
  },
  extensions = {
    project = {
      sync_with_nvim_tree = true,
    }
  }
}
pcall(telescope.load_extension, 'fzf')
