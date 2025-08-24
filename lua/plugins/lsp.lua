return {
  -- Mason (LSP + tools installer)
  { "williamboman/mason.nvim", build = ":MasonUpdate", opts = {} },
  { "williamboman/mason-lspconfig.nvim" },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "typescript-language-server",
        "eslint-lsp",
        "prettierd",
      },
      run_on_start = true,
    },
  },

  -- Core LSP config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "folke/neodev.nvim",
    },
    config = function()
      require("neodev").setup({})

      local lspconfig = require("lspconfig")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Shared on_attach
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Goto definition")
        map("n", "gD", vim.lsp.buf.declaration, "Goto declaration")
        map("n", "gi", vim.lsp.buf.implementation, "Goto implementation")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "K", vim.lsp.buf.hover, "Hover docs")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>f", function()
          require("conform").format({ async = false })
        end, "Format buffer")
      end

      -- TypeScript
      lspconfig.ts_ls.setup({
        on_attach = on_attach,
        capabilities = capabilities,
      })

      -- ESLint
      lspconfig.eslint.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        settings = { workingDirectory = { mode = "auto" } },
      })

      -- Diagnostics UI
      vim.diagnostic.config({
        float = { border = "rounded" },
        severity_sort = true,
        virtual_text = { spacing = 2, prefix = "●" },
      })
    end,
  },
}

