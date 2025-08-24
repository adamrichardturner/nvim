# Neovim TS + Monokai


- Theme: Monokai Pro
- File Explorer: nvim-tree
- LSP: tsserver (typescript-language-server), eslint
- Format: Prettier via conform.nvim (prettierd if available)
- Fuzzy: Telescope
- Syntax: Treesitter (TS/TSX)
- Completion: nvim-cmp + LuaSnip


### First run
1. Open Neovim. lazy.nvim installs plugins.
2. `:Mason` shows tools; mason-tool-installer auto-installs tsserver, eslint, prettierd.
3. Open a TS/TSX file. `:LspInfo` should show `tsserver` and `eslint` attached.
4. `<leader>t` toggles file tree. `<leader>ff` finds files. `<leader>f` formats.
