vim.g.mapleader = " "

vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.opt.clipboard = 'unnamedplus'

vim.opt.number = true
vim.opt.relativenumber = true

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })


local filetype_settings = {
  lua = { tabstop = 2, shiftwidth = 2, expandtab = true },
  html = { tabstop = 2, shiftwidth = 2, expandtab = true },
  css = { tabstop = 2, shiftwidth = 2, expandtab = true },
}

for filetype, settings in pairs(filetype_settings) do
  vim.api.nvim_create_autocmd("FileType", {
    pattern = filetype,
    callback = function()
      vim.bo.tabstop = settings.tabstop
      vim.bo.shiftwidth = settings.shiftwidth
      vim.bo.expandtab = settings.expandtab
    end
  })
end
