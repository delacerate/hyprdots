return { "nvim-lualine/lualine.nvim", requires = { "nvim-tree/nvim-web-devicons", opt = true } },
  require("lualine").setup({
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  })
