return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function ()
      local treesitter = require("nvim-treesitter")
      treesitter.setup()
      treesitter.install { "lua", "vim", "vimdoc", "toml", "python", "typescript", "html" }

      vim.api.nvim_create_autocmd('FileType', {
        pattern = { "lua", "vim", "vimdoc", "toml", "python", "typescript", "html" },
        callback = function()
        -- syntax highlighting, provided by Neovim
        vim.treesitter.start()
        -- indentation, provided by nvim-treesitter
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end,
      })
    end
}

