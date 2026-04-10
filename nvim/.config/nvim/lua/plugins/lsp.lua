
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  { "neovim/nvim-lspconfig" },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("mason-lspconfig").setup({
        -- provide the LSPs you want installed here
        -- TODO: add vtsls and prettier (prettierd)
        ensure_installed = {
          "basedpyright",
          "lua_ls",
          "bashls",
        },
        automatic_installation = false, -- if true, will install by file extension
        automatic_enable = true,
    })
    end,
  },
}

