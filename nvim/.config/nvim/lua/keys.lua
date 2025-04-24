
-- Set leader key
vim.g.mapleader = " " -- space
vim.g.maplocalleader = "\\" -- backslash

-- mapping helper
function map(mode, lhs, rhs, opts)
  local default_opts = { noremap = true, silent = true }
  local final_opts = opts and vim.tbl_extend("force", default_opts, opts) or default_opts

  -- Support single or multiple modes
  if type(mode) == "string" then
    mode = { mode }
  end

  for _, m in ipairs(mode) do
    vim.keymap.set(m, lhs, rhs, final_opts)
  end
end

-- navigation
map('i', 'jk', '<ESC>')
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')

-- telescope
map('n', '<leader>f', '<cmd>Telescope find_files hidden=true<cr>')

-- yank to system register
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>d", '"+d')

