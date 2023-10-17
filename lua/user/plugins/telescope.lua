local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require "telescope.actions"
telescope.setup{
	defaults = {
		layout_config = {
			horizontal = {
				preview_cutoff = 0,
			},
		},
		-- Default configuration for telescope goes here:
		-- config_key = value,
		mappings = {
			i = {
				-- map actions.which_key to <C-h> (default: <C-/>)
				-- actions.which_key shows the mappings for your picker,
				-- e.g. git_{create, delete, ...}_branch for the git_branches picker
				["<C-h>"] = "which_key"
			}
		}
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
		}
	}
}

telescope.load_extension('fzf')
