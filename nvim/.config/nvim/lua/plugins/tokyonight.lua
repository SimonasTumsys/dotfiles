
return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  transparent = true,
  style = "night",
  config = function()
    require("tokyonight").setup {
      styles = {
        comments = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      }
    }
  vim.cmd.colorscheme 'tokyonight-night'
  end,
}

