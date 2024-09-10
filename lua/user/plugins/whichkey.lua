local satus_ok, wk = pcall(require, "which-key")


---@class wk.Opts
local defaults = {
  ---@type false | "classic" | "modern" | "helix"
  preset = "modern",
  -- Delay before showing the popup. Can be a number or a function that returns a number.
  ---@type number | fun(ctx: { keys: string, mode: string, plugin?: string }):number
  delay = function(ctx)
    return ctx.plugin and 0 or 200
  end,
  ---@param mapping wk.Mapping
  filter = function(mapping)
    -- example to exclude mappings without a description
    -- return mapping.desc and mapping.desc ~= ""
    return true
  end,
  --- You can add any mappings here, or use `require('which-key').add()` later
  ---@type wk.Spec
  spec = {},
  -- show a warning when issues were detected with your mappings
  notify = true,
  -- Which-key automatically sets up triggers for your mappings.
  -- But you can disable this and setup the triggers manually.
  -- Check the docs for more info.
  ---@type wk.Spec
  triggers = {
    { "<auto>", mode = "nxsot" },
  },
  -- Start hidden and wait for a key to be pressed before showing the popup
  -- Only used by enabled xo mapping modes.
  ---@param ctx { mode: string, operator: string }
  defer = function(ctx)
    return ctx.mode == "V" or ctx.mode == "<C-V>"
  end,
  plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    spelling = {
      enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
      suggestions = 20, -- how many suggestions should be shown in the list?
    },
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  },
  ---@type wk.Win.opts
  win = {
    -- don't allow the popup to overlap with the cursor
    no_overlap = true,
    -- width = 1,
    -- height = { min = 4, max = 25 },
    -- col = 0,
    -- row = math.huge,
    -- border = "none",
    padding = { 1, 2 }, -- extra window padding [top/bottom, right/left]
    title = true,
    title_pos = "center",
    zindex = 1000,
    -- Additional vim.wo and vim.bo options
    bo = {},
    wo = {
      -- winblend = 10, -- value between 0-100 0 for fully opaque and 100 for fully transparent
    },
  },
  layout = {
    width = { min = 20 }, -- min and max width of the columns
    spacing = 3, -- spacing between columns
  },
  keys = {
    scroll_down = "<c-d>", -- binding to scroll down inside the popup
    scroll_up = "<c-u>", -- binding to scroll up inside the popup
  },
  ---@type (string|wk.Sorter)[]
  --- Mappings are sorted using configured sorters and natural sort of the keys
  --- Available sorters:
  --- * local: buffer-local mappings first
  --- * order: order of the items (Used by plugins like marks / registers)
  --- * group: groups last
  --- * alphanum: alpha-numerical first
  --- * mod: special modifier keys last
  --- * manual: the order the mappings were added
  --- * case: lower-case first
  sort = { "local", "order", "group", "alphanum", "mod" },
  ---@type number|fun(node: wk.Node):boolean?
  expand = 0, -- expand groups when <= n mappings
  -- expand = function(node)
  --   return not node.desc -- expand all nodes without a description
  -- end,
  -- Functions/Lua Patterns for formatting the labels
  ---@type table<string, ({[1]:string, [2]:string}|fun(str:string):string)[]>
  replace = {
    key = {
      function(key)
        return require("which-key.view").format(key)
      end,
      -- { "<Space>", "SPC" },
    },
    desc = {
      { "<Plug>%(?(.*)%)?", "%1" },
      { "^%+", "" },
      { "<[cC]md>", "" },
      { "<[cC][rR]>", "" },
      { "<[sS]ilent>", "" },
      { "^lua%s+", "" },
      { "^call%s+", "" },
      { "^:%s*", "" },
    },
  },
  icons = {
    breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
    separator = "➜", -- symbol used between a key and it's label
    group = "+", -- symbol prepended to a group
    ellipsis = "…",
    -- set to false to disable all mapping icons,
    -- both those explicitely added in a mapping
    -- and those from rules
    mappings = true,
    --- See `lua/which-key/icons.lua` for more details
    --- Set to `false` to disable keymap icons from rules
    ---@type wk.IconRule[]|false
    rules = {},
    -- use the highlights from mini.icons
    -- When `false`, it will use `WhichKeyIcon` instead
    colors = true,
    -- used by key format
    keys = {
      Up = " ",
      Down = " ",
      Left = " ",
      Right = " ",
      C = "󰘴 ",
      M = "󰘵 ",
      D = "󰘳 ",
      S = "󰘶 ",
      CR = "󰌑 ",
      Esc = "󱊷 ",
      ScrollWheelDown = "󱕐 ",
      ScrollWheelUp = "󱕑 ",
      NL = "󰌑 ",
      BS = "󰁮",
      Space = "󱁐 ",
      Tab = "󰌒 ",
      F1 = "󱊫",
      F2 = "󱊬",
      F3 = "󱊭",
      F4 = "󱊮",
      F5 = "󱊯",
      F6 = "󱊰",
      F7 = "󱊱",
      F8 = "󱊲",
      F9 = "󱊳",
      F10 = "󱊴",
      F11 = "󱊵",
      F12 = "󱊶",
    },
  },
  show_help = true, -- show a help message in the command line for using WhichKey
  show_keys = true, -- show the currently pressed key and its label as a message in the command line
  -- disable WhichKey for certain buf types and file types.
  disable = {
    ft = {},
    bt = {},
  },
  debug = false, -- enable wk.log in the current directory
}


local keymaps ={
	{
		--- ############### Quick SHORTCUTS
		{ "<leader>b", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Explore", mode = "n" },
		{ "<leader>f", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
		{ "<leader>g", "<cmd>Telescope live_grep<cr>", desc = "Find Text", nowait = true, remap = false },
		{ "<leader>o", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
		{ "<leader>q", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", nowait = true, remap = false },
		{ "<leader>r", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", mode = "n" },
		{ "<leader>s", "<cmd>split<cr>", desc = "Horizontal Split", nowait = true, remap = false },
		{ "<leader>v", "<cmd>vsplit<cr>", desc = "Vertical Split", nowait = true, remap = false },
		{ "<leader>t", "<cmd>ToggleTerm<cr>", desc = "Open / Close", nowait = true, remap = false },
		
	
		--- ############### FILE MNGS
		{ "<leader>F", group = "Files" }, -- group
		{ "<leader>Ff", "<cmd>Telescope find_files<cr>", desc = "Find File", mode = "n" },
		{ "<leader>Fr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", mode = "n" },

		
		-----------------------------------------------------
		
		--- ############### TERMINAL MNGS
		{ "<leader>T", group = "Terminal" },
		{ "<leader>Tt", "<cmd>ToggleTerm<cr>", desc = "Open / Close", nowait = true, remap = false },

		-----------------------------------------------------


		--- ############### GIT MNGS
		{ "<leader>G", group = "Git", nowait = true, remap = false },
		{ "<leader>GR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer"},
		{ "<leader>Gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout Branch"},
		{ "<leader>Gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout Commit"},
		{ "<leader>Gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff"},
		{ "<leader>Gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit"},
		{ "<leader>Gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk"},
		{ "<leader>Gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk"},
		{ "<leader>Gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame"},
		{ "<leader>Go", "<cmd>Telescope git_status<cr>", desc = "Open Changed File"},
		{ "<leader>Gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk"},
		{ "<leader>Gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk"},
		{ "<leader>Gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk"},
		{ "<leader>Gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>"},

		--- ############### MISC MNSG
		{ "<leader>B", group = "Buffers" },
		{ "<leader>Bb", "<cmd>Telescope buffers<cr>", desc = "Buffers", mode = "n" },

		--- ############### BUF/WIN MNSG
		{ "<leader>W", group = "Windows" },
		{ "<leader>Ws", "<cmd>split<cr>", desc = "Horizontal Split", nowait = true, remap = false },
		{ "<leader>Wv", "<cmd>vsplit<cr>", desc = "Vertical Split", nowait = true, remap = false },
		{ "<leader>Wh", "<C-W>h", desc = "Move Focus Left", nowait = true, remap = false },
		{ "<leader>Wj", "<C-W>j", desc = "Move Focus Down", nowait = true, remap = false },
		{ "<leader>Wk", "<C-W>k", desc = "Move Focus Up", nowait = true, remap = false },
		{ "<leader>Wl", "<C-W>l", desc = "Move Focus Right", nowait = true, remap = false },
		{ "<leader>Wq", "<C-W>q", desc = "Close Split", nowait = true, remap = false },

		--- ############### LSP MNSG
		{ "<leader>L", group = "LSP", nowait = true, remap = false },
		{ "<leader>LI", "<cmd>LspInstallInfo<cr>", desc = "Installer Info", nowait = true, remap = false },
		{ "<leader>LS", "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", desc = "Workspace Symbols", nowait = true, remap = false },
		{ "<leader>La", "<cmd>lua vim.lsp.buf.code_action()<cr>", desc = "Code Action", nowait = true, remap = false },
		{ "<leader>Ld", "<cmd>Telescope diagnostics bufnr=0<cr>", desc = "Document Diagnostics", nowait = true, remap = false },
		{ "<leader>Lf", "<cmd>lua vim.lsp.buf.format{async=true}<cr>", desc = "Format", nowait = true, remap = false },
		{ "<leader>Li", "<cmd>LspInfo<cr>", desc = "Info", nowait = true, remap = false },
		{ "<leader>Lj", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", desc = "Next Diagnostic", nowait = true, remap = false },
		{ "<leader>Lk", "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>", desc = "Prev Diagnostic", nowait = true, remap = false },
		{ "<leader>Ll", "<cmd>lua vim.lsp.codelens.run()<cr>", desc = "CodeLens Action", nowait = true, remap = false },
		{ "<leader>Lq", "<cmd>lua vim.diagnostic.setloclist()<cr>", desc = "Quickfix", nowait = true, remap = false },
		{ "<leader>Lr", "<cmd>lua vim.lsp.buf.rename()<cr>", desc = "Rename", nowait = true, remap = false },
		{ "<leader>Ls", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Document Symbols", nowait = true, remap = false },
		{ "<leader>Lw", "<cmd>Telescope diagnostics<cr>", desc = "Workspace Diagnostics", nowait = true, remap = false },
	}
}

wk.setup(defaults)
wk.add(keymaps)

