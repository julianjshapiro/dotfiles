vim.opt.updatetime = 500
vim.api.nvim_create_autocmd({"TextChanged", "TextChangedI", "CursorHold"}, {
  pattern = {"*.tex"},
  callback = function()
    if vim.bo.modified then
      vim.cmd("silent write")  -- autosave without message
    end
  end,
})
-- Plugin list (inside return block)
return {
  { "nvim-lua/plenary.nvim" },
  { "nvim-telescope/telescope.nvim", tag = "0.1.8" },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "neovim/nvim-lspconfig" },
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/vim-vsnip" },
	{
  "folke/tokyonight.nvim",
  lazy = false,          -- load immediately
  priority = 1000,       -- load before other plugins
  config = function()
    vim.cmd([[colorscheme tokyonight]])
  end,
},
}
