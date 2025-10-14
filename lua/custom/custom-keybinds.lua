-- local function map(mode, lhs, rhs, opts)
--   local options = { noremap = true, silent = true }
--   if opts then
--     if opts.desc then
--       opts.desc = 'keymaps.lua: ' .. opts.desc
--     end
--     options = vim.tbl_extend('force', options, opts)
--   end
--   vim.keymap.set(mode, lhs, rhs, options)
-- end
--
-- vim.keymap.set('n', '<leader>/', 'gcc', { remap = true })
-- vim.keymap.set('v', '<leader>/', 'gc', { remap = true })
--

vim.keymap.set({ 'x', 'n' }, '<leader>d', '"_d', { remap = false, desc = 'Delete without copying' })

local operator_rhs = function()
  return require('vim._comment').operator()
end
vim.keymap.set({ 'x' }, '<leader>/', operator_rhs, { expr = true, desc = 'Toggle comment' })

local line_rhs = function()
  return require('vim._comment').operator() .. '_'
end
vim.keymap.set('n', '<leader>/', line_rhs, { expr = true, desc = 'Toggle comment line' })

vim.g.tex_flavor = 'latex'

local list_snips = function()
  local ft_list = require('luasnip').available()[vim.o.filetype]
  local ft_snips = {}
  for _, item in pairs(ft_list) do
    ft_snips[item.trigger] = item.name
  end
  print(vim.inspect(ft_snips))
end

vim.api.nvim_create_user_command('SnipList', list_snips, {})

local list_all_snips = function()
  local ft_lists = require('luasnip').available()
  local ft_snips = {}
  for _, ft_list in pairs(ft_lists) do
    for _, item in pairs(ft_list) do
      ft_snips[item.trigger] = item.name
    end
  end
  print(vim.inspect(ft_snips))
end

vim.api.nvim_create_user_command('SnipListAll', list_all_snips, {})
