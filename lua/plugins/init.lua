return {
  -- Theme
  {
    "loctvl842/monokai-pro.nvim",
    priority = 1000,
    lazy = false,
    config = function()
      require("monokai-pro").setup()
      vim.cmd.colorscheme("monokai-pro")
    end,
  },

  -- Statusline
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = { options = { theme = "auto", globalstatus = true } },
  },

  -- File explorer
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    keys = {
      { "<leader>t", "<cmd>NvimTreeToggle<CR>", desc = "Tree toggle" },
      { "<leader>o", "<cmd>NvimTreeFindFile<CR>", desc = "Tree reveal" },
    },
    opts = { update_focused_file = { enable = true } },
  },

  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
      { "<leader>fb", function() require("telescope.builtin").buffers() end, desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
    },
  },

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua","vim","vimdoc",
        "typescript","tsx","javascript","json","html","css","bash",
        "markdown","markdown_inline","regex",
      },
      highlight = { enable = true },
      indent = { enable = true },
    },
  },

  -- Git signs
  { "lewis6991/gitsigns.nvim", opts = {} },

  -- Comments / surround / autopairs
  { "numToStr/Comment.nvim", opts = {} },
  { "kylechui/nvim-surround", opts = {} },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
      local ok, cmp = pcall(require, "cmp")
      if ok then
        local cmp_autopairs = require("nvim-autopairs.completion.cmp")
        cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      end
    end,
  },

  -- Indent guides & TODOs
  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
  { "folke/todo-comments.nvim", dependencies = { "nvim-lua/plenary.nvim" }, opts = {} },

  -- Formatting
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        javascript = { "prettierd", "prettier" },
        javascriptreact = { "prettierd", "prettier" },
        typescript = { "prettierd", "prettier" },
        typescriptreact = { "prettierd", "prettier" },
        json = { "prettierd", "prettier" },
        css = { "prettierd", "prettier" },
        html = { "prettierd", "prettier" },
        yaml = { "prettierd", "prettier" },
        markdown = { "prettierd", "prettier" },
      },
      format_on_save = { lsp_fallback = true, timeout_ms = 500 },
    },
  },

  -- LSP setup
  { import = "plugins.lsp" },

  -- Completion setup
  { import = "plugins.cmp" },
}

