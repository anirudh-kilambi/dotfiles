return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            {"nvim-lua/plenary.nvim"},
        },
        opts = {
            model = "claude-sonnet-4.6",
            temperature = 0.25,
            headers = {
                user = "-_-",
                assistant = "^_^",
                tool = "*_*",

            },
            separator = "----",
            auto_fold = false,
            auto_insert_mode = true
        },
        keys = {
            -- Open the CopilotChat window in normal mode
            { "<leader>zc", ":CopilotChat<CR>", mode = "n", desc = "Chat with Copilot" },
            -- Open the model selection menu for CopilotChat
            { "<leader>zm", ":CopilotChatModels<CR>", mode = "n", desc = "Show copilot chat models" },
            -- Explain the selected code using Copilot (visual mode)
            { "<leader>ze", ":CopilotChatExplain<CR>", mode = "v", desc = "Explain code" },
            -- Review the selected code for issues using Copilot (visual mode)
            { "<leader>zr", ":CopilotChatReview<CR>", mode = "v", desc = "Review code" },
            -- Fix issues in the selected code using Copilot (visual mode)
            { "<leader>zf", ":CopilotChatFix<CR>", mode = "v", desc = "Fix code issues" },
            -- Optimize the selected code using Copilot (visual mode)
            { "<leader>zo", ":CopilotChatOptimize<CR>", mode = "v", desc = "Optimize code" },
            -- Generate documentation for the selected code using Copilot (visual mode)
            { "<leader>zd", ":CopilotChatDocs<CR>", mode = "v", desc = "Generate docs" },
            -- Generate tests for the selected code using Copilot (visual mode)
            { "<leader>zt", ":CopilotChatTests<CR>", mode = "v", desc = "Generate tests" },
        }
    }
}
