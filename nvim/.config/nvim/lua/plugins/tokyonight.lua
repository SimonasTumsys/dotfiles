
return {
  "folke/tokyonight.nvim",
--  lazy = false,
--  priority = 1000,
  config = function()
    require("tokyonight").setup {
      transparent = true,
      style = "night",
      styles = {
        comments = { italic = false },
        sidebars = "transparent",
        floats = "transparent",
      }
    }
  end,
}

