return {
  "github/copilot.vim",
  config = function()
    vim.keymap.set('i', '<S-Tab>', 'copilot#Accept("\\<CR>")', {
      expr = true,
      silent = true,
      replace_keycodes = false, -- https://github.com/orgs/community/discussions/29817
     })
  end,
}
