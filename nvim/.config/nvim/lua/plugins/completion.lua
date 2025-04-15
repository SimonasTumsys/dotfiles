
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- Completion sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        -- Trigger completion while typing (not only on explicit requests)
        completion = {
          autocomplete = { require("cmp.types").cmp.TriggerEvent.TextChanged },
        },
        -- Configure snippets with vsnip
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
       -- Key mappings for completion behavior
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping.select_next_item(),    -- Navigate to next suggestion
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),  -- To previous suggestion
          ["<C-Space>"] = cmp.mapping.complete(),        -- Manually trigger completion
          ["<C-e>"] = cmp.mapping.abort(),               -- Cancel completion
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Insert,
            select = false, -- Only confirm selection if explicitly selected with Tab
          }),
        }),

        -- List of sources used for completion suggestions
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "nvim_lsp_signature_help" },
          { name = "buffer" },
          { name = "path" },
          { name = "vsnip" },
        }),

        -- Custom formatting for completion entries
        formatting = {
          fields = { "menu", "abbr", "kind" },
          format = function(entry, item)
            local icons = {
              nvim_lsp = "λ",
              vsnip = "⋗",
              buffer = "Ω",
              path = "🖫",
              nvim_lua = "Π",
            }
            item.menu = icons[entry.source.name]
            return item
          end,
        },

        -- Bordered windows for completion menu and docs
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
      })
    end,
  },
}

