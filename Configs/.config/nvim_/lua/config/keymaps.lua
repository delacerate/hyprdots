-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<leader>ci ", "<cmd>Copilot enable<CR>", { desc = "copilot on" })
map("n", "<leader>co ", "<cmd>Copilot disable<CR>", { desc = "copilot off" })
map("n", "<leader>cr ", "<cmd>Copilot status<CR>", { desc = "copilot status" })

-- dadbod keymaps
map("n", "<leader>dv", "<cmd>DBUIToggle<CR>", { desc = "dadbod toggle" })

-- Variable to keep track of dadbod.nvim UI state

-- Keymap to toggle dadbod.nvim UI

map("n", "<leader>su", "<cmd>Telescope harpoon marks<CR>", { desc = "harpoon marks" })
