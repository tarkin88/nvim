return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  config = function()
    local mason = require "mason"
    local mr = require("mason-registry")

    local opts = {
      ensure_installed = {
        "stylua",
        "black",
        "isort",
        "debugpy",
        "shfmt",
        "pylint",
      },
      ui = {
        border = "none",
        icons = {
          package_installed = "i",
          package_pending = "p",
          package_uninstalled = "u",
        },
      },

      log_level = vim.log.levels.ERROR,
      max_concurrent_installers = 4,
    }
    mason.setup(opts)

    mr.refresh(function()
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then p:install() end
      end
    end)
  end,
}

