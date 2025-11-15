return {
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
            {"nvim-lua/plenary.nvim"},
        },
        opts = {
            model = "claude-4.5",
            temperature = 0.25,
            window = {
                layout = "float",
                width = 240,
                height = 60,
                border = "rounded",
                title = " Copilot Chat ",
                zindex = 100,
            },
            headers = {
                user = "-_-",
                assistant = "^_^",
                tool = "*_*",

            },
            separator = "----",
            auto_fold = false,
            auto_insert_mode = true
        }
    }
}
