return {
	{
		"github/copilot.vim",
		config = function()
			vim.cmd([[highlight CopilotSuggestion ctermfg=8 guifg=white guibg=#5c6370]])
			vim.keymap.set("n", "<leader>cp", "<cmd>Copilot enable<CR>", { silent = true })
			vim.keymap.set("n", "<leader>cd", "<cmd>Copilot disable<CR>", { silent = true })
			vim.keymap.set("n", "<leader>cs", "<cmd>Copilot status<CR>", { silent = true })
		end,
	},
  { 
		"zbirenbaum/copilot-cmp",
		event = { "BufEnter" },
		dependencies = { "zbirenbaum/copilot.lua" },
		config = function()
			require("copilot_cmp").setup()
		end,
	},
}
