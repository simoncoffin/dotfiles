vim.g.mapleader = " "
vim.g.copilot_no_tab_map = true -- must run before copilot is loaded

require("simoncoffin/lazy")

local set = vim.opt

-----------------------------------
--    VISUAL MARKERS | LAYOUT    --
-----------------------------------
set.cc = "120"                -- set vertical marker at line 120 (cc = color column, I think) 
set.cursorline = true         -- highlight current line, currently handled by colorscheme
set.number = true             -- show actual line numbers (for current line only if relativenumber is set)
set.ruler = true              -- ruler at bottom right to show line and column
set.splitbelow = true         -- default to split new window below current one
set.splitright = true         -- default vsplit to open to right of current window


------------------------------------------
--    SPACES | TABBING | WHITE SPACE    --
------------------------------------------
set.tabstop = 2               -- make tab visually appear 2 spaces wide
set.shiftwidth = 2            -- set width when indenting (e.g. using '>>')
set.expandtab = true          -- insert real spaces instead of tabs when using tab key
set.autoindent = true         -- automatically indent a NEW line to match previous line
set.breakindent = true        -- automatically indent soft wrapped lines to match line above
set.textwidth = 0             -- no text width
set.wrapmargin = 0            -- no wrap margin
set.wrap = true               -- soft wrap long lines instead of breaking them into actual new lines
set.linebreak = true          -- break lines at 'breakat' chars (default is \" ^I!@*-+;:,./?")
set.showbreak = '>>>>'        -- show broken lines by indenting with '>>'

--------------------------------------
--    CLIPBOARD | MOUSE | ALERTS    -- 
--------------------------------------
set.clipboard = "unnamedplus"
set.mouse = 'a'               -- enable mouse in all modes
-- set.visualbell = true         -- disable audio bell

vim.keymap.set("n", "<leader>nh", "<cmd>nohlsearch<cr>", { desc = "unhighlight searched text" })

vim.api.nvim_create_user_command("HS", "sp", { force = true })
vim.api.nvim_create_user_command("VS", "vsp", { force = true })

vim.keymap.set("n", "<leader>tt", "<cmd>NvimTreeFindFileToggle!<cr>", { desc = "NvimTree toggle and find file" })

vim.keymap.set("n", "<leader>gv", "<cmd>Gvdiffsplit<cr>", { desc = "Git diff with vertical split" })


-- tab next and ta prevb
-- vim.keymap.set("n", "bn", "<cmd>BufferLineCycleNext<cr>", {})
-- vim.keymap.set("n", "bp", "<cmd>BufferLineCyclePrev<cr>", {})

vim.cmd 'colorscheme material'
