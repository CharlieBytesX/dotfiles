return {
  "mfussenegger/nvim-dap",
  lazy = true,
  dependencies = {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require('plugins.dap')
      -- require("mason-nvim-dap").setup({ ensure_installed = { "firefox", "node2" } })
    end,
    "theHamsta/nvim-dap-virtual-text",
    "rcarriga/nvim-dap-ui",
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/cmp-dap",
  },
  keys = {
    { "<leader>d", desc = "Open Debug menu" },
  },
  config = function()
    local ok_telescope, telescope = pcall(require, "telescope")
    if ok_telescope then
      telescope.load_extension("dap")
    end

    local ok_cmp, cmp = pcall(require, "cmp")
    if ok_cmp then
      cmp.setup.filetype({ "dap-repl", "dapui_watches" }, {
        sources = cmp.config.sources({
          { name = "dap" },
        }, {
          { name = "buffer" },
        }),
      })
    end
  end,
}
