return {
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add          = { text = "│" },
                change       = { text = "│" },
                delete       = { text = "_" },
                topdelete    = { text = "‾" },
                changedelete = { text = "~" },
            },
        },
        config = function(_, opts)
            require("gitsigns").setup(opts)
            vim.keymap.set("n", "]c", require("gitsigns").next_hunk, { desc = "Next hunk" })
            vim.keymap.set("n", "[c", require("gitsigns").prev_hunk, { desc = "Prev hunk" })
            vim.keymap.set("n", "<leader>hs", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
            vim.keymap.set("n", "<leader>hu", require("gitsigns").undo_stage_hunk, { desc = "Undo stage" })
            vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
        end,
    }
}
