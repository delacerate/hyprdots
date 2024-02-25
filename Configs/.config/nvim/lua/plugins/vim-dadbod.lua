return {
  {'tpope/vim-dadbod'},
  {'kristijanhusak/vim-dadbod-ui',
  config = function()
    vim.keymap.set('n', '<leader>du', ':DBUIToggle<CR>', {desc = 'DB toggle'}, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>ds', ':DBUISelect<CR>', {desc = 'DB select'}, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>de', ':DBUIExecute<CR>', {desc = 'DB execute'}, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>dr', ':DBUIRename<CR>', {desc= 'DB rename'},  {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>dc', ':DBUIClear<CR>', {desc = 'DB clear'}, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>dp', ':DBUIPick<CR>', {desc = 'DB pick'}, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>df', ':DBUIFindBuffer<CR>', {desc = 'DB find buffer'}, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>dl', ':DBUILastQueryInfo<CR>', {desc ='DB last query'}, {noremap = true, silent = true})
    vim.keymap.set('n', '<leader>dh', ':DBUIHelp<CR>', {desc = 'DB help'}, {noremap = true, silent = true})
    vim.g.db_ui_show_help = 0
    vim.g.db_ui_use_nerd_fonts = 1
  end
  },
  {'kristijanhusak/vim-dadbod-completion',}
}

