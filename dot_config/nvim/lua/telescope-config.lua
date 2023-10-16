local telescope = require('telescope')

telescope.load_extension('projects')
telescope.load_extension("live_grep_args")

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
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
  },
  extensions = {
    project = {
      sync_with_nvim_tree = true,
    },
    live_grep_args = {
      auto_quoting = true,
    }
  }
}
pcall(telescope.load_extension, 'fzf')
