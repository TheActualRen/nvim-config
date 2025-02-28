return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
	config = function()
		local harpoon = require("harpoon")
		local telescope = require("telescope")

		harpoon:setup()
		telescope.load_extension("harpoon")

		-- Add current file to Harpoon
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add current file to Harpoon" })

		-- Enhanced Harpoon menu with delete support
		vim.keymap.set("n", "<leader>hh", function()
			telescope.extensions.harpoon.marks({
				show_all = true,
				attach_mappings = function(prompt_bufnr, map)
					local action_state = require("telescope.actions.state")
					local actions = require("telescope.actions")

					local function delete_mark()
						local selection = action_state.get_selected_entry()
						if not selection then
							return
						end

						harpoon:list():remove(selection.value)
						actions.close(prompt_bufnr)
						vim.schedule(function()
							telescope.extensions.harpoon.marks({ show_all = true })
						end)
					end

					map("i", "<C-x>", delete_mark)
					map("n", "<C-x>", delete_mark)
					return true
				end,
			})
		end, { desc = "Open Harpoon menu" })

		-- Alt+Number navigation (works in most terminals)
		vim.keymap.set("n", "<A-1>", function()
			harpoon:list():select(1)
		end, { desc = "Jump to mark 1" })
		vim.keymap.set("n", "<A-2>", function()
			harpoon:list():select(2)
		end, { desc = "Jump to mark 2" })
		vim.keymap.set("n", "<A-3>", function()
			harpoon:list():select(3)
		end, { desc = "Jump to mark 3" })
		vim.keymap.set("n", "<A-4>", function()
			harpoon:list():select(4)
		end, { desc = "Jump to mark 4" })

		-- Cycle through marks
		vim.keymap.set("n", "<C-S-U>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-S-D>", function()
			harpoon:list():next()
		end)
	end,
}
