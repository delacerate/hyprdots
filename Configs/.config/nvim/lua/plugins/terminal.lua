return {
  "akinsho/toggleterm.nvim",
  version = "*",
  config = true,
  config = function ()
  vim.keymap.set("n", "<C-t>", "<cmd>lua require('toggleterm').toggle()<CR>")
  vim.keymap.set("t", "<C-t>", "<cmd>lua require('toggleterm').toggle()<CR>")
  end,

}

