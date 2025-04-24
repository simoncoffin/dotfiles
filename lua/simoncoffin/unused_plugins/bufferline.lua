return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  config = function()
    require('bufferline').setup({
      options = {
        separator_style = "thin",
        numbers = "buffer_id",
        offsets = {
          {
              filetype = "NvimTree",
              text = "File Explorer",
              text_align = "center",
              separator = true
          }
        },
        highlights = {
          buffer_selected = {
            fg = "#FF0000",
            bg = "#FF0000",
          }
        },
        indicator = {
          style = 'underline'
        },
       -- diagnostics = "nvim_lsp",
      }
    })

    local k_set = vim.keymap.set
    k_set("n", "[b", "<cmd>bprevious<cr>", { desc = "Go to prev buffer" })
    k_set("n", "]b", "<cmd>bnext<cr>", { desc = "Go to next buffer" })
    k_set("n", "[[b", "<cmd>bfirst<cr>", { desc = "Go to first buffer" })
    k_set("n", "]]b", "<cmd>blast<cr>", { desc = "Go to last buffer" })
  end
}
