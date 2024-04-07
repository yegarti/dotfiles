-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {

  -- Integration with Tmux for navigation
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
  },

  'lambdalisue/suda.vim',

  {
    'Pocco81/auto-save.nvim',
    enabled = true,
    trigger_events = { 'InsertLeave' },
    condition = function(buf)
      local fn = vim.fn
      local utils = require 'auto-save.utils.data'

      if fn.getbufvar(buf, '&modifiable') == 1 and utils.not_in(fn.getbuvar(buf, '&filetype'), {}) then
        return true
      end
      return false
    end,
    write_all_buffers = false,
    debounce_delay = 135,
  },
}
-- vim: ts=2 sts=2 sw=2 et
