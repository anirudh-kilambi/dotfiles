local map = vim.keymap.set --alias for mapping

-- general mappings
map("n", "<leader>cl", "<cmd>nohlsearch<CR>", { desc = "Clear search highlight" })
map("n", "<leader>l", "<cmd>ls<CR>", {desc = "List buffers" })
map("n", "<leader>w", ":ls<CR>:b <Space>", { desc = "Switch buffer" })
map("n", "<leader>jj", ":%!jq .<CR>", { silent = true, desc = "Prettify JSON" })
map("n", "<leader>co", ":CopilotChat<CR>", {silent = true, desc = "Open Copilot Chat" })
map("n", "<leader>cc", ":CopilotChatClose<CR>", {silent = true, desc = "Open Copilot Chat" })


