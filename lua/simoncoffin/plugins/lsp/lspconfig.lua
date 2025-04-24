return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local k_set = vim.keymap.set -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(_, bufnr)
      opts.buffer = bufnr
      local vd = vim.diagnostic
      local vds = vd.severity

      -- set keybinds
      opts.desc = "Show LSP references"
      k_set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      k_set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      k_set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      k_set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      k_set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      k_set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      k_set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      k_set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      k_set("n", "<leader>d", vd.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      k_set("n", "[d", vd.goto_prev, opts) -- jump to previous diagnostic in buffer
      opts.desc = "Go to previous diagnostic ERROR"
      k_set("n", "[e", function() vd.goto_prev({ severity = vds.ERROR }) end, opts)
      opts.desc = "Go to previous diagnostic WARNING"
      k_set("n", "[n", function() vd.goto_prev({ severity = vds.WARN }) end, opts)
      opts.desc = "Go to previous diagnostic INFO or HINT"
      k_set("n", "[i", function() vd.goto_prev({ severity = { vds.INFO, vds.HINT }}) end, opts)

      opts.desc = "Go to next diagnostic"
      k_set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer
      opts.desc = "Go to next diagnostic ERROR"
      k_set("n", "]e", function() vd.goto_next({ severity = vds.ERROR }) end, opts)
      opts.desc = "Go to next diagnostic WARNING"
      k_set("n", "]n", function() vd.goto_next({ severity = vds.WARN }) end, opts)
      opts.desc = "Go to next diagnostic INFO or HINT"
      k_set("n", "]i", function() vd.goto_next({ severity = { vds.INFO, vds.HINT }}) end, opts)

      opts.desc = "Show documentation for what is under cursor"
      k_set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      k_set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

      opts.desc = "Auto fix"
      k_set("n", "<leader>af", vim.lsp.buf.code_action, opts) -- auto fix
    end

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    for type, icon in pairs(signs) do
      local hl = "DiagnosticSign" .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
    end


    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["graphql"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
    })

    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["jsonls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize "vim" global
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand("$VIMRUNTIME/lua")] = true,
              [vim.fn.stdpath("config") .. "/lua"] = true,
            },
          },
        },
      },
    })

    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["rubocop"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      -- cmd = { "bin/rubocop", "--lsp" },
      -- root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
    })

    lspconfig["sorbet"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["sqlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
      root_dir = lspconfig.util.root_pattern("Gemfile", ".git"),
      -- init_options = {
      --   hostInfo = 'neovim',
      --   maxTsServerMemory = 8192,
      --   tsserver = { useSyntaxServer = 'never' },
      -- },
    })

    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
}
