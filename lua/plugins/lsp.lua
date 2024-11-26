-- a function to return a table of on_attach and capabilities
local function get_handlers()
  local handlers = {}

  -- handlers.capabilities = vim.lsp.protocol.make_client_capabilities()
  handlers.capabilities = vim.lsp.protocol.make_client_capabilities()
  handlers.capabilities.textDocument.completion.completionItem.snippetSupport = true

  local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    local keymap = vim.api.nvim_buf_set_keymap
    keymap(bufnr, "n", "<leader>l", "", { desc = "+lsp", noremap = true })
    keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { desc = "go to declaration", noremap = true })
    keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { desc = "go to definition", noremap = true })
    keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { silent = true, noremap = true })
    keymap(
      bufnr,
      "n",
      "<leader>li",
      "<cmd>lua vim.lsp.buf.implementation()<CR>",
      { desc = "implementations", noremap = true }
    )
    keymap(bufnr, "n", "<leader>lr", "<cmd>lua vim.lsp.buf.references()<CR>", { desc = "references", noremap = true })
    keymap(
      bufnr,
      "n",
      "<F12>",
      "<cmd>lua vim.diagnostic.open_float()<CR>",
      { desc = "float diagnostic", noremap = true }
    )
    keymap(
      bufnr,
      "n",
      "<leader>lc",
      "<cmd>lua vim.lsp.codelens.run()<CR>",
      { desc = "code lens actions", noremap = true }
    )
    keymap(
      bufnr,
      "n",
      "<F2>",
      "<cmd>lua vim.lsp.buf.rename()<CR>",
      { desc = "rename current line word", noremap = true }
    )
    keymap(
      bufnr,
      "n",
      "<leader>la",
      "<cmd>lua vim.lsp.buf.code_action()<CR>",
      { desc = "code actions", noremap = true }
    )
  end

  handlers.on_attach = function(client, bufnr)
    lsp_keymaps(bufnr)
    local success, illuminate = pcall(require, "illuminate")
    if not success then
      vim.notify "Failed to load plugin: illuminate"
      return
    end

    illuminate.on_attach(client)
  end

  return handlers
end

return {

  -- github repository for lsp
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    require "plugins.mason",
    "williamboman/mason-lspconfig.nvim",
    "RRethy/vim-illuminate",
    -- "saghen/blink.cmp",
  },

  config = function()
    local signs = {
      active = true,
      text = {
        [vim.diagnostic.severity.ERROR] = " ",
        [vim.diagnostic.severity.WARN] = " ",
        [vim.diagnostic.severity.HINT] = "󰠠 ",
        [vim.diagnostic.severity.INFO] = " ",
      },
    }

    -- for _, sign in pairs(signs) do
    --   vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
    -- end

    local config = {
      virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = "●",
      },
      signs = signs,
      update_in_insert = false,
      underline = true,
      severity_sort = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    }

    vim.diagnostic.config(config)

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
    -- vim.lsp.handlers["textDocument/signatureHelp"] =
    --   vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
    require("lspconfig.ui.windows").default_options.border = "rounded"

    local servers = {
      "lua_ls",
      "jsonls",
      "bashls",
      "pyright",
      "yamlls",
    }

    require("mason-lspconfig").setup {
      ensure_installed = servers,
      automatic_installation = true,
    }

    local success, lspconfig = pcall(require, "lspconfig")
    if not success then
      vim.notify "Failed to load plugin: lspconfig"
      return
    end

    local opts = {}
    local handlers = get_handlers()

    for _, server in pairs(servers) do
      opts = {
        on_attach = handlers.on_attach,
        -- capabilities = handlers.capabilities,
        -- capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities),
      }

      server = vim.split(server, "@")[1]

      lspconfig[server].setup(opts)
    end

    vim.keymap.set("n", "<leader>lR", ":LspRestart<CR>", { noremap = true, silent = true, desc = "Restart LSP" })
  end,
}
