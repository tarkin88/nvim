return {
  {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async", "neovim/nvim-lspconfig" },
    keys = {
      { "zR", function() require("ufo").openAllFolds() end,  desc = "Open All Folds", },
      { "zM", function() require("ufo").closeAllFolds() end, desc = "Close All Folds", },
    },
    opts = {
      enable_get_fold_virt_text = true,
      open_fold_hl_timeout = 300,
    },
    config = function(_, opts)
      require("ufo").setup(opts)
    end,
  },
}
