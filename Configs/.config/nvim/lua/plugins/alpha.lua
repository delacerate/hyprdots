return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
  
  event = { "VimEnter", "BufReadPost", "BufNewFile" },
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")

		dashboard.section.header.val = {
			[[                                                ]],
      [[                                                ]],
      [[      ___      __                      __       ]],
			[[     / _ \___ / /__ ________ _______ _/ /____   ]],
			[[    / // / -_) / _ `/ __/ -_) __/ _ `/ __/ -_)  ]],
			[[   /____/\__/_/\_,_/\__/\__/_/  \_,_/\__/\__/   ]],
			[[                                                ]],
      [[                                                ]],
      [[                                                ]],
		}

		alpha.setup(dashboard.opts)
	end,
}
