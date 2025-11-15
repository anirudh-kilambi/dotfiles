local plugin_files = {
  "plenary",
  "telescope",
  "treesitter",
  "copilot",
  "copilot-chat",
  "gitsigns",
}

local plugins = {}

for _, file in ipairs(plugin_files) do
  local ok, mod = pcall(require, "plugins." .. file)
  if ok then
    for _, plugin in ipairs(mod) do
      table.insert(plugins, plugin)
    end
  else
    vim.notify("Failed to load " .. file .. ": " .. mod, vim.log.levels.WARN)
  end
end

return plugins




  ---- Git signs
  --{
    --"lewis6991/gitsigns.nvim",
    --opts = {
      --signs = {
        --add          = { text = "│" },
        --change       = { text = "│" },
        --delete       = { text = "_" },
        --topdelete    = { text = "‾" },
        --changedelete = { text = "~" },
      --},
    --},
    --config = function(_, opts)
      --require("gitsigns").setup(opts)
      --vim.keymap.set("n", "]c", require("gitsigns").next_hunk, { desc = "Next hunk" })
      --vim.keymap.set("n", "[c", require("gitsigns").prev_hunk, { desc = "Prev hunk" })
      --vim.keymap.set("n", "<leader>hs", require("gitsigns").stage_hunk, { desc = "Stage hunk" })
      --vim.keymap.set("n", "<leader>hu", require("gitsigns").undo_stage_hunk, { desc = "Undo stage" })
      --vim.keymap.set("n", "<leader>hp", require("gitsigns").preview_hunk, { desc = "Preview hunk" })
    --end,
  --},

  ---- File tree
  --{
    --"nvim-tree/nvim-tree.lua",
    --dependencies = { "nvim-tree/nvim-web-devicons" },
    --config = function()
      --require("nvim-tree").setup({})
      --vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file tree" })
    --end,
  --},

  --------------------------------------------------------------------
  ---- LSP + Completion (modern Neovim API only) + basedpyright
  --------------------------------------------------------------------

  ---- Use Mason to install server binaries (basedpyright, lua-language-server, tsserver, clangd)
  --{ "williamboman/mason.nvim", config = true },

  ---- Completion engine
  --{
    --"hrsh7th/nvim-cmp",
    --dependencies = {
      --"hrsh7th/cmp-nvim-lsp",
      --"hrsh7th/cmp-buffer",
      --"hrsh7th/cmp-path",
      --"L3MON4D3/LuaSnip",
      --"saadparwaiz1/cmp_luasnip",
    --},
    --config = function()
      --local cmp = require("cmp")
      --local luasnip = require("luasnip")
      --cmp.setup({
        --snippet = { expand = function(args) luasnip.lsp_expand(args.body) end },
        --mapping = cmp.mapping.preset.insert({
          --["<CR>"]     = cmp.mapping.confirm({ select = false }),
          --["<C-Space>"]= cmp.mapping.complete(),
          --["<Tab>"]    = cmp.mapping(function(fallback)
            --if cmp.visible() then cmp.select_next_item()
            --elseif luasnip.expand_or_jumpable() then luasnip.expand_or_jump()
            --else fallback() end
          --end, { "i", "s" }),
          --["<S-Tab>"]  = cmp.mapping(function(fallback)
            --if cmp.visible() then cmp.select_prev_item()
            --elseif luasnip.jumpable(-1) then luasnip.jump(-1)
            --else fallback() end
          --end, { "i", "s" }),
        --}),
        --sources = {
          --{ name = "nvim_lsp" },
          --{ name = "path" },
          --{ name = "buffer" },
          --{ name = "luasnip" },
        --},
        --completion = { completeopt = "menuone,noselect" },
      --})
    --end,
  --},

  ---- (Optional) include nvim-lspconfig ONLY for :LspInfo docs; we will NOT call require('lspconfig')
  --{
    --"neovim/nvim-lspconfig",
    --config = function()
      ---- Capabilities for nvim-cmp
      --local capabilities = vim.lsp.protocol.make_client_capabilities()
      --local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
      --if ok_cmp then capabilities = cmp_lsp.default_capabilities(capabilities) end

      ---- Buffer-local keymaps on attach
      --local function on_attach(_, bufnr)
        --local function map(mode, lhs, rhs, desc)
          --vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        --end
        --map("n", "gd", vim.lsp.buf.definition,          "Go to definition")
        --map("n", "gr", vim.lsp.buf.references,          "References")
        --map("n", "gi", vim.lsp.buf.implementation,      "Implementation")
        --map("n", "K",  vim.lsp.buf.hover,               "Hover")
        --map("n", "<leader>rn", vim.lsp.buf.rename,      "Rename")
        --map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        --map("n", "[d", vim.diagnostic.goto_prev,        "Prev diagnostic")
        --map("n", "]d", vim.diagnostic.goto_next,        "Next diagnostic")
        --map("n", "<leader>fd", vim.diagnostic.open_float, "Line diagnostics")
      --end

      ---- Helper: find project root from markers
      --local function find_root(markers)
        --local buf = vim.api.nvim_get_current_buf()
        --local name = vim.api.nvim_buf_get_name(buf)
        --local start_dir = (name == "" and vim.loop.cwd()) or vim.fs.dirname(name)
        --local root_file = vim.fs.find(markers, { path = start_dir, upward = true })[1]
        --return root_file and vim.fs.dirname(root_file) or start_dir
      --end

      ---- Start a server when a matching FileType opens
      --local function start_on_filetype(ft_pattern, mkconfig)
        --vim.api.nvim_create_autocmd("FileType", {
          --pattern = ft_pattern,
          --callback = function()
            --local cfg = mkconfig() or {}
            --cfg.root_dir   = cfg.root_dir or find_root(cfg.root_markers or { ".git" })
            --cfg.capabilities = cfg.capabilities or capabilities
            --cfg.on_attach    = cfg.on_attach or on_attach
            --vim.lsp.start(vim.lsp.config(cfg))
          --end,
        --})
      --end


      ---- basedpyright (Python)
      --start_on_filetype({ "python" }, function()
        --return {
          --name = "basedpyright",
          --cmd = { "basedpyright-langserver", "--stdio" },
          --filetypes = { "python" },
          --root_markers = { "pyproject.toml", "requirements.txt", "setup.py", "setup.cfg", ".git" },
          --settings = {
            --basedpyright = {
              --disableOrganizeImports = false,
              --analysis = {
                --diagnosticMode = "workspace",  -- "openFilesOnly"|"workspace"
                --typeCheckingMode = "basic",    -- "off"|"basic"|"strict"
                --autoImportCompletions = true,
              --},
            --},
          --},
        --}
      --end)

      ---- TypeScript/JavaScript (tsserver via typescript-language-server)
      --start_on_filetype({ "javascript", "javascriptreact", "typescript", "typescriptreact" }, function()
        --return {
          --name = "tsserver",
          --cmd = { "typescript-language-server", "--stdio" },
          --filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
          --root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
          --init_options = { hostInfo = "neovim" },
        --}
      --end)

      ---- Lua
      --start_on_filetype({ "lua" }, function()
        --return {
          --name = "lua_ls",
          --cmd = { "lua-language-server" },
          --filetypes = { "lua" },
          --root_markers = { ".luarc.json", ".luarc.jsonc", ".git" },
          --settings = {
            --Lua = {
              --diagnostics = { globals = { "vim" } },
              --workspace = { checkThirdParty = false },
              --telemetry = { enable = false },
            --},
          --},
        --}
      --end)

      ---- C/C++
      --start_on_filetype({ "c", "cpp", "objc", "objcpp" }, function()
        --return {
          --name = "clangd",
          --cmd = { "clangd" },
          --filetypes = { "c", "cpp", "objc", "objcpp" },
          --root_markers = { "compile_commands.json", ".git" },
        --}
      --end)

      ---- Optional: pretty diagnostic signs
      --local signs = { Error = "", Warn = "", Hint = "", Info = "" }
      --for type, icon in pairs(signs) do
        --local hl = "DiagnosticSign" .. type
        --vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      --end
    --end,
  --},

  ---- Copilot (optional)
  --{ "github/copilot.vim" },
-- }


