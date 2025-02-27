--vim.cmd.source("~/.vimrc")

local lazypath = "~/.vim/plugged/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")
