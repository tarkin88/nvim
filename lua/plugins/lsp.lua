local servers = {
  "dockerls",
  "pyright",
  "bashls",
  "lua_ls",
  "jsonls",
  "tsserver",
}

return {
  { "b0o/SchemaStore.nvim" },
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = {
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = {
            "black",
            "pylint",
            "isort",
            "stylua",
            "luacheck",
          },
          automatic_installation = true,
          automatic_setup = false,
        },
        config = function(_, opts)
          local mason_null_ls = require "mason-null-ls"

          local null_ls = require "null-ls"
          local null_ls_source = null_ls.builtins
          local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

          null_ls.setup {
            on_attach = function(client, bufnr)
              if client.supports_method "textDocument/formatting" then
                vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
                vim.api.nvim_create_autocmd("BufWritePre", {
                  group = augroup,
                  buffer = bufnr,
                  callback = function()
                    vim.lsp.buf.format {
                      bufnr = bufnr,
                      filter = function(client) return client.name == "null-ls" end,
                    }
                  end,
                })
              end
            end,
            sources = {
              null_ls_source.formatting.stylua,
              null_ls_source.formatting.black,
              null_ls_source.completion.spell,
            },
          }

          mason_null_ls.setup(opts)
          mason_null_ls.setup_handlers {}
        end,
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    ft = {
      "typescript",
      "json",
      "lua",
      "python",
      "sh",
    },
    config = function()
      local present, lspconfig = pcall(require, "lspconfig")

      if not present then return end

      local capabilities = vim.lsp.protocol.make_client_capabilities()

      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      local signs = {
        Error = " ",
        Warn = " ",
        Info = " ",
        Hint = " ",
      }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.diagnostic.config {
        virtual_text = true,
        underline = true,
        signs = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      }
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

      vim.lsp.handlers["textDocument/signatureHelp"] =
        vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

      vim.lsp.handlers["workspace/diagnostic/refresh"] = function(_, _, ctx)
        local ns = vim.lsp.diagnostic.get_namespace(ctx.client_id)
        local bufnr = vim.api.nvim_get_current_buf()
        vim.diagnostic.reset(ns, bufnr)
        return true
      end

      for _, server in ipairs(servers) do
        lspconfig[server].setup {
          capabilities = capabilities,
        }
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Acciones LSP",
        callback = function()
          local bufmap = function(mode, lhs, rhs)
            local opts = { buffer = true }
            vim.keymap.set(mode, lhs, rhs, opts)
          end
          bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>")
          bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>")
          bufmap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>")
          bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>")
          bufmap("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>")
          bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>")
          bufmap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<cr>")
          bufmap("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>")
          bufmap("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>")
          bufmap("x", "<F4>", "<cmd>lua vim.lsp.buf.range_code_action()<cr>")
          bufmap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
          bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
          bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
        end,
      })
    end,
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        cmd = { "LspInstall", "LspUninstall" },
        opts = {
          ensure_installed = servers,
          automatic_installation = true,
        },
        config = function(_, opts)
          local mason_lspconfig = require "mason-lspconfig"
          mason_lspconfig.setup(opts)
          -- mason_lspconfig.setup_handlers { function(server) require("core.utils.lsp").setup(server) end }
          -- require("core.utils").event "LspSetup"
        end,
      },
    },
  },
  {
    "williamboman/mason.nvim",
    cmd = {
      "Mason",
      "MasonInstall",
      "MasonUninstall",
      "MasonUninstallAll",
      "MasonLog",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_uninstalled = "✗",
          package_pending = "⟳",
        },
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      for _, plugin in ipairs { "mason-lspconfig", "mason-null-ls", "mason-nvim-dap" } do
        pcall(require, plugin)
      end
    end,
  },
}
