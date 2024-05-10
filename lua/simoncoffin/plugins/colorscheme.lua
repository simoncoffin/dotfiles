return {
  "marko-cerovac/material.nvim",
  lazy = false,
  config = function()
    vim.g.material_style = 'darker'
    -- 'darker' | 'lighter' | 'palenight' | 'deep ocean' | 'oceanic'
    require('material').setup({
      contrast = {
        sidebars = true, -- sidebar bg color will be darker
        cursor_line = true, -- cursorline bg color will be darker
        floating_windows = true, -- floating windows bg color will be darker
      },
      plugins = {
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope",
      },
       styles = {
        comments = { italic = true },
      },
    })
  end,
}
