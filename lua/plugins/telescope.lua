return {
  "nvim-telescope/telescope.nvim",
  event = "UIEnter",
  dependencies = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function() return vim.fn.executable("make") == 1 end,
    },
  },
  config = function()
    -- use protected call to attempt to load telescope
    local success, telescope = pcall(require, "telescope")
    if not success then
      vim.notify("Failed to load plugin: telescope")
      return
    end

    local actions = require("telescope.actions")

    telescope.setup({

      defaults = {
        prompt_prefix = "",
        selection_caret = "  ",
        scroll_strategy = "limit",
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        path_display = { shorten = 9 },
        mappings = {
          i = {},
          n = {},
        },

        -- ignore file that is not supposed to be found through telescope
        file_ignore_patterns = {
          ".git/",
          "%.bin",
          "%.cmake",
          "%.check_cache",
          "%.dir",
          "%.docx",
          "%.gif",
          "%.jpg",
          "%.jpeg",
          "%.json",
          "%.key",
          "%.make",
          "%.marks",
          "%.md",
          "%.o",
          "%.out",
          "%.pdf",
          "%.png",
          "%.pptx",
          "%.pth",
          "%.pyc",
          "%.so",
          "%.vtu",
          "%.wav",
          "%.xlsx",
        },
      },

      pickers = {
        live_grep = {
          mappings = {
            i = { ["<c-f>"] = actions.to_fuzzy_refine },
          },
        },
        grep_string = {
          mappings = {
            i = { ["<c-f>"] = actions.to_fuzzy_refine },
          },
        },
        find_files = {
          theme = "dropdown",
          previewer = true,
          -- hidden = true,
          find_command = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--files",
            "--hidden",
            "-g",
            "!.git",
          },
          mappings = {
            i = { ["<c-f>"] = actions.to_fuzzy_refine },
          },
        },
        oldfiles = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
          mappings = {
            i = { ["<c-f>"] = actions.to_fuzzy_refine },
          },
        },
        git_status = {
          theme = "dropdown",
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
        },
        lsp_document_symbols = {
          theme = "dropdown",
          mappings = {
            i = { ["<c-f>"] = actions.to_fuzzy_refine },
          },
        },
      },
    })

    -- enable telescope extensions if they are installed
    success, _ = pcall(require("telescope").load_extension, "fzf")
    if not success then
      vim.notify("Failed to load telescope extension fzf")
      return
    end

    -- custom keymaps for telescope
    local builtin = require("telescope.builtin")

    vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "find files" })
    vim.keymap.set("n", "<leader>f", "", { desc = "+search" })
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "files" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "recents" })
    vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "diagnostic" })
    vim.keymap.set("n", "<leader>fb", builtin.current_buffer_fuzzy_find, { desc = "fuzzy" })
    vim.keymap.set("n", "<leader>fs", builtin.live_grep, { desc = "live grep" })
    vim.keymap.set("n", "<leader>fg", builtin.grep_string, { desc = "grep" })
    vim.keymap.set("n", "<M-up>", builtin.buffers, { desc = "buffers list" })
    vim.keymap.set("n", "<leader>ls", builtin.lsp_document_symbols, { desc = "symbols" })
  end,
}
