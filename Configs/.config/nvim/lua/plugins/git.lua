return {
  {
    "tpope/vim-fugitive"
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
    require('gitsigns').setup({
      signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
  current_line_blame = false,
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr=true})

    -- Actions
    map({'n', 'v'}, '<leader>hs', ':Gitsigns stage_hunk<CR>')
    map({'n', 'v'}, '<leader>hr', ':Gitsigns reset_hunk<CR>')
    map('n', '<leader>hS', gs.stage_buffer, {description = 'Stage all changes'})
    map('n', '<leader>ha', gs.stage_hunk, {description = 'Stage current hunk'})
    map('n', '<leader>hu', gs.undo_stage_hunk, {description = 'Undo stage hunk'})
    map('n', '<leader>hR', gs.reset_buffer, {description = 'Reset buffer'})
    map('n', '<leader>hp', gs.preview_hunk, {description = 'Preview hunk'})
    map('n', '<leader>hb', function() gs.blame_line{full=true} end, {description = 'Blame line'})
    map('n', '<leader>tb', gs.toggle_current_line_blame, {description = 'Toggle current line blame'})
    map('n', '<leader>hd', gs.diffthis, {description = 'Diff current hunk'})
    map('n', '<leader>hD', function() gs.diffthis('~') end, {description = 'Diff current hunk (base)'})
    map('n', '<leader>td', gs.toggle_deleted, {description = 'Toggle deleted'})

    -- Text object
    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {description = 'Select hunk'})
  end,
})

      vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", {}, {description = "Preview hunk"})
      vim.keymap.set("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", {}, {description = "Toggle current line blame"})
    end
  }
}
