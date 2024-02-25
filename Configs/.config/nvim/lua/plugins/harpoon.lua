return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<A-a>", mark.add_file)
    vim.keymap.set("n", "<A-r>", mark.rm_file)
    vim.keymap.set("n", "<A-e>", ui.toggle_quick_menu)

    vim.keymap.set("n", "<A-h>", function()
      ui.nav_file(1)
    end)
    vim.keymap.set("n", "<A-t>", function()
      ui.nav_file(2)
    end)
    vim.keymap.set("n", "<A-n>", function()
      ui.nav_file(3)
    end)
    vim.keymap.set("n", "<A-s>", function()
      ui.nav_file(4)
    end)
  end,
}
