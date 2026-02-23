-- init.lua
--

vim.o.conceallevel = 2  -- or 1, depending on your preference

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

-- Run latexmk -c automatically on closing any .tex buffer
vim.api.nvim_create_autocmd("BufWinLeave", {
  pattern = "*.tex",
  callback = function()
    vim.fn.jobstart({ "latexmk", "-c" }, { detach = true })
  end,
})

