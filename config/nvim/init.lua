	---@diagnostic disable: undefined-global
vim.g.mapleader = " "
vim.g.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.autochdir = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.cursorline = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.incsearch = true
vim.o.swapfile = false
vim.o.backup = false
vim.o.wrap = false
vim.o.undofile = true
vim.o.undodir = os.getenv("HOME") .. "/.cache/nvim/undodir"

local map = vim.keymap.set
map("n", "<C-h>", "<C-w><C-h>")
map("n", "<C-j>", "<C-w><C-j>")
map("n", "<C-k>", "<C-w><C-k>")
map("n", "<C-l>", "<C-w><C-l>")

map("t", "<ESC>", "<C-\\><C-n>")
map("n", "<leader>t", ":below term<CR>i")

map({"n","v"}, "<leader>y", "\"+y")

vim.pack.add({
	{ src = "https://github.com/ej-shafran/compile-mode.nvim" },
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/vague-theme/vague.nvim" },
	{ src = "https://github.com/Saghen/blink.cmp",     version = vim.version.range("*") },
})

--vim.cmd.colorscheme "vscode"
vim.cmd.colorscheme "vague"

vim.g.compile_mode = {
	default_command = {
		c = "cc -o %:r % && ./%:r",
	},
	recompile_no_fail = true,
	bang_expansion = true,
	focus_compilation_buffer = true,
}

map("n", "<leader>R", ":below Compile<CR>")
map("n", "<leader>r", ":below Recompile<CR>")

vim.diagnostic.config({
	signs = false,
	virtual_text = {
		current_line = true,
	}
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("clangd")
vim.lsp.enable("pyright")
vim.lsp.enable("nixd")
vim.lsp.enable("jdtls")

require("oil").setup({
	skip_confirm_for_simple_edits = true,
})

require("blink.cmp").setup({
	keymap = { preset = "super-tab" },
	fuzzy = { implementation = "prefer_rust" },
	signature = { enabled = true },
	completion = {
		trigger = { show_in_snippet = false },
		documentation = { auto_show = true },
	},
})

require('vim._core.ui2').enable()
