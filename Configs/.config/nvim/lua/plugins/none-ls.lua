return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.diagnostics.erb_lint,
				null_ls.builtins.diagnostics.eslint_d,
				null_ls.builtins.diagnostics.rubocop,
				null_ls.builtins.formatting.rubocop,
			},
		})
	vim.keymap.set("n", "<leader>gf", "<cmd>lua require('null-ls').code_action()<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>gg", vim.lsp.buf.format, { noremap = true, silent = true })
	end,
}
