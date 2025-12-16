--  You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{ -- harpoon.nvim
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")
			harpoon:setup({})

			-- basic telescope configuration
			local conf = require("telescope.config").values
			local function toggle_telescope(harpoon_files)
				local finder = function()
					local paths = {}
					for _, item in ipairs(harpoon_files.items) do
						table.insert(paths, item.value)
					end

					return require("telescope.finders").new_table({
						results = paths,
					})
				end

				require("telescope.pickers")
					.new({}, {
						prompt_title = "Harpoon",
						finder = finder(),
						previewer = false,
						initial_mode = "normal",
						sorter = require("telescope.config").values.generic_sorter({}),
						layout_config = {
							height = 0.4,
							width = 0.5,
							prompt_position = "top",
							preview_cutoff = 120,
						},
						attach_mappings = function(prompt_bufnr, map)
							map("n", "<C-d>", function()
								local state = require("telescope.actions.state")
								local selected_entry = state.get_selected_entry()
								local current_picker = state.get_current_picker(prompt_bufnr)

								table.remove(harpoon_files.items, selected_entry.index)
								current_picker:refresh(finder())
							end)
							return true
						end,
					})
					:find()
			end

			vim.keymap.set("n", "<C-e>", function()
				toggle_telescope(harpoon:list())
			end, { desc = "Open harpoon window" })

			vim.keymap.set("n", "<C-a>", function()
				harpoon:list():add()
			end, { desc = "[A]dd to harpoon list" })

			vim.keymap.set("n", "<C-d>", function()
				harpoon:list():remove()
			end, { desc = "[D]elete from harpoon list" })

			vim.keymap.set("n", "<Tab>", function()
				harpoon:list():next()
			end, { desc = "Move to next harpooned file" })

			vim.keymap.set("n", "<S-Tab>", function()
				harpoon:list():prev()
			end, { desc = "Move to prev harpooned file" })
		end,
	},
}
