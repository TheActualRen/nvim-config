return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			local telescope = require('telescope')
			local actions = require('telescope.actions')
			local builtin = require('telescope.builtin')

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							['<C-u>'] = actions.move_selection_previous, -- Move up
							['<C-d>'] = actions.move_selection_next,     -- Move down
						},
					},
				},
			})

			vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
		end
	},
	{
		'nvim-telescope/telescope-ui-select.nvim',
		config = function()
			require('telescope').setup({
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown({}),
					},
				},
			})
			require('telescope').load_extension('ui-select')
		end
	},
}

