return {
  {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      event = { "BufReadPost", "BufNewFile" },
      config = function()
        require("nvim-treesitter.configs").setup({
          ensure_installed = {
            "vim", "lua", "c", "python", "java", "rust", "yaml", "markdown", "json"
          },
          highlight               = { enable = true },
          indent                  = { enable = false },
          incremental_selection   = { enable = true }
        })
      end,
  }
}
