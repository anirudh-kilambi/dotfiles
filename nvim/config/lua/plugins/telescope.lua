return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                layout_strategy = "flex",
                sorting_strategy = "ascending",
                layout_config = { prompt_position = "bottom" }
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown {
                        -- even more opts
                    }
                }
            }
        })
        pcall(telescope.load_extension, "fzf")
        pcall(telescope.load_extension, "ui-select")
        local tb = require("telescope.builtin")
        local map = vim.keymap.set
        vim.keymap.set("n", "<leader>ff", tb.find_files, { desc = "Regular find files" })
        vim.keymap.set("n", "<leader>fg", tb.git_files, { desc = "FZF Git equivalent" })
        vim.keymap.set("n", "<leader>fw", tb.buffers, { desc = "FZF Window search" })
        vim.keymap.set("n", "<leader>fh", tb.help_tags, { desc = "These are all the :h searches" })
        vim.keymap.set("n", "<leader>fd", tb.diagnostics, { desc = "IDK what this is yet" })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function() return vim.fn.executable("make") == 1
    end,
  }
}
