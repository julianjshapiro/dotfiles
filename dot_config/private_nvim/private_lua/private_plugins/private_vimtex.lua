-- ~/.config/nvim/lua/plugins/vimtex.lua
return {
  {
    "lervag/vimtex",
    init = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "zathura"
      vim.g.vimtex_quickfix_mode = 0
      vim.g.tex_conceal = "abdmg"
      vim.opt.conceallevel = 1
    end,
    ft = { "tex", "latex" },
  },
}

