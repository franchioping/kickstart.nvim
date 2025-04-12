return {

  {
    'lervag/vimtex',
    lazy = false, -- we don't want to lazy load VimTeX
    -- tag = "v2.15", -- uncomment to pin to a specific release
    init = function()
      -- VimTeX configuration goes here, e.g.
      vim.g.vimtex_view_method = 'zathura'
    end,
    config = function()
      vim.g.vimtex_compiler_latexmk = { ['out_dir'] = '/home/franchioping/Notes/build' }
    end,
  },
  {
    'franchioping/luasnip-latex-snippets.nvim',
    dev = true,
  },
  -- {
  --   'iurimateus/luasnip-latex-snippets.nvim',
  --   -- vimtex isn't required if using treesitter
  --   requires = { 'L3MON4D3/LuaSnip', 'lervag/vimtex' },
  --   config = function()
  --     require('luasnip-latex-snippets').setup()
  --     -- or setup({ use_treesitter = true })
  --     require('luasnip').config.setup { enable_autosnippets = true }
  --   end,
  -- },
}
