return {
  "nvim-tree/nvim-tree.lua",
  -- version = "*",
  tag = "1.7.1", -- 1.8.* makes closing slow, likely a git related issue
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    -- for now leave enabled to use Gbrowse
    -- vim.g.loaded_netrw = 1
    -- vim.g.loaded_netrwPlugin = 1

    -- set termguicolors to enable highlight groups
    vim.opt.termguicolors = true

    -- OR setup with some options
    require("nvim-tree").setup({
      sort = {
        sorter = "case_sensitive",
      },
      view = {
        width = 60,
      },
      renderer = {
        group_empty = true,
      },
      filesystem_watchers = {
        enable = false,
        debounce_delay = 50,
        ignore_dirs = {
          "node_modules",
          "/node_modules",
        },
      },
      filters = {
        dotfiles = true,
        git_ignored = true,
        custom = {
          "^\\.git$",
          ".*\\.irb$",
        },
      },
      git = {
        enable = true,
        timeout = 600,
      },
    })

    local k_set = vim.keymap.set
    k_set("n", "<leader>nt", "<cmd>NvimTreeFindFileToggle!<cr>", { desc = "|n|vimTree |t|oggle  - toggle + find file" })
    k_set("n", "<leader>nn", "<cmd>NvimTreeFindFileToggle!<cr>", { desc = "|n|vimTree |n|o <OR> |n|ow - toggle + find file" })
    k_set("n", "<leader>nc", "<cmd>NvimTreeFindFile!<cr>",       { desc = "|n|vimTree |c|urrent - find file" })
    k_set("n", "<leader>ns", "<cmd>NvimTreeResize 30<cr>",       { desc = "|n|vimTree |s|small  - resize small" })
    k_set("n", "<leader>nl", "<cmd>NvimTreeResize 60<cr>",       { desc = "|n|vimTree |n|arge   - resize large" })

    -- set nvim tree directory to that of active file when opening
    --[[
    vim.api.nvim_create_autocmd({"BufEnter"}, {
      pattern = "*",
      command = "lcd %:p:h",
    })
    --]]

    -- auto open nvim tree to current file
    vim.api.nvim_create_autocmd({"VimEnter"}, {
      pattern = "*",
      command = "NvimTreeFindFile!",
    })

    -- move cursor back to previous buffer (file) when nvim tree opens during initial nvim startup
    vim.api.nvim_create_autocmd({"VimEnter"}, {
      pattern = "*",
      command = "wincmd p",
    })
  end,
}
