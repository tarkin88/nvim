return {
  "neoclide/coc.nvim",
  branch = "release",
  ft = {
    "json",
    "lua",
    "markdown",
    "python",
    "sh",
  },
  config = function()
    vim.g.coc_global_extensions = {
      "coc-actions",
      "coc-pairs",
      "coc-stylua",
      "coc-pyright",
      "coc-json",
      "coc-diagnostic",
      "coc-dictionary",
      "coc-docker",
      "coc-marketplace",
      "coc-lists",
      "coc-tag",
      "coc-word",
    }

    function _G.check_back_space()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    function _G.show_docs()
      local cw = vim.fn.expand "<cword>"
      if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
        vim.api.nvim_command("h " .. cw)
      elseif vim.api.nvim_eval "coc#rpc#ready()" then
        vim.fn.CocActionAsync "doHover"
      else
        vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
      end
    end
    -- Highlight the symbol and its references when holding the cursor.

    vim.api.nvim_create_augroup("CocGroup", {})
    vim.api.nvim_create_autocmd("CursorHold", {
      group = "CocGroup",
      command = "silent call CocActionAsync('highlight')",
      desc = "Highlight symbol under cursor on CursorHold",
    })
    -- Setup formatexpr specified filetype(s).

    vim.api.nvim_create_autocmd("FileType", {
      group = "CocGroup",
      pattern = "typescript,json",
      command = "setl formatexpr=CocAction('formatSelected')",
      desc = "Setup formatexpr specified filetype(s).",
    })
    -- Update signature help on jump placeholder.

    vim.api.nvim_create_autocmd("User", {
      group = "CocGroup",
      pattern = "CocJumpPlaceholder",
      command = "call CocActionAsync('showSignatureHelp')",
      desc = "Update signature help on jump placeholder",
    })

    vim.api.nvim_create_user_command("Format", "call CocAction('format')", {})
    vim.api.nvim_create_user_command("Fold", "call CocAction('fold', <f-args>)", { nargs = "?" })
    vim.api.nvim_create_user_command("OR", "call CocActionAsync('runCommand', 'editor.action.organizeImport')", {})

    local keyset = vim.keymap.set
    -- Autocomplete
    function _G.check_back_space()
      local col = vim.fn.col "." - 1
      return col == 0 or vim.fn.getline("."):sub(col, col):match "%s" ~= nil
    end

    local keymap = vim.keymap.set
    -- Silent keymap option
    local opts = { silent = true, noremap = true }

    -- Coc
    keymap("n", "<F9>", "<cmd>Format<cr>", { silent = true })
    keymap(
      "i",
      "<TAB>",
      'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
      { silent = true, noremap = true, expr = true, replace_keycodes = false }
    )
    keymap(
      "i",
      "<S-TAB>",
      [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]],
      { silent = true, noremap = true, expr = true, replace_keycodes = false }
    )
    keymap(
      "i",
      "<cr>",
      [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
      { silent = true, noremap = true, expr = true, replace_keycodes = false }
    )
    keymap("i", "<c-space>", "coc#refresh()", { silent = true, expr = true })

    keymap("n", "<C-j>", "<Plug>(coc-diagnostic-prev)", opts)
    keymap("n", "<C-k>", "<Plug>(coc-diagnostic-next)", opts)

    keymap("n", "gd", "<Plug>(coc-definition)", opts)
    keymap("n", "gy", "<Plug>(coc-type-definition)", opts)
    keymap("n", "gi", "<Plug>(coc-implementation)", opts)
    keymap("n", "gr", "<Plug>(coc-references)", opts)
    keymap("n", "K", "<cmd>lua _G.show_docs()<cr>", opts)
    keymap("x", "<leader>f", "<Plug>(coc-format-selected)", opts)
    keymap("n", "<leader>f", "<Plug>(coc-format-selected)", opts)
    keymap("n", "<leader>ac", "<Plug>(coc-codeaction)", opts)
    keymap("n", "<leader>qf", "<Plug>(coc-fix-current)", opts)
    keymap("n", "<leader>cl", "<Plug>(coc-codelens-action)", opts)
    keymap("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
    keymap("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
  end,
}
