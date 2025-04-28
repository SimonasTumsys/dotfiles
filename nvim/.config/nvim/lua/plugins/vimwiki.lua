return {
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
      {
        path = '~/Documents/Notes/home',
        diary_rel_path = 'diary/',
      },
      {
        path = '~/Documents/Notes/work',
        diary_rel_path = 'diary/',
      },
    }

     -- Function to insert a template into new diary notes
      local function insert_diary_template()
        local file = vim.fn.expand("%:p")
        if string.match(file, "/diary/") then
          if vim.fn.line('$') == 1 and vim.fn.getline(1) == "" then
            local today = os.date("%A, %B %d, %Y")
            vim.api.nvim_buf_set_lines(0, 0, -1, false, {
              "= " .. today .. " =",
              "",
              "== TODO ==",
              "- [ ] Task 1",
              "- [ ] Task 2",
              "",
              "== Notes ==",
              "- ",
            })
          end
        end
      end

      -- Autocmd to trigger on opening .wiki files
      vim.api.nvim_create_autocmd("BufNewFile", {
        pattern = "*.wiki",
        callback = insert_diary_template,
      })

    end,
  },
}
