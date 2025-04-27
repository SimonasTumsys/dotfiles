
return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
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
    })
      -- auto-attach lspconfig to each installed server
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end,
  },
  { "neovim/nvim-lspconfig" },
}

