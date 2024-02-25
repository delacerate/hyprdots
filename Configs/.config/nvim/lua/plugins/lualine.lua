return {
	"nvim-lualine/lualine.nvim",
	config = function()
		require("lualine").setup({
		options = {
        theme = "kanagawa",
        component_separators = { left = "│", right = "│" },
        section_separators = { left = "", right = "" },
        --component_separators = { left = "", right = "" },
        --section_separators = { left = "", right = "" },
        -- component_separators = { left = "│", right = "│" },
        -- section_separators = { left = " ", right = " " },
        -- component_separators = { left = " ", right = " " },
        -- section_separators = { left = "", right = "" },
        --component_separators = { left = " ", right = " " },
        --section_separators = { left = " ", right = " " },
    },
  })
	end,
}
