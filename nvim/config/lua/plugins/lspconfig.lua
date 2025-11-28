return {
  {
    "williamboman/mason.nvim",
    config = true,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "pyright" },
      })

    local mason_bin = vim.fn.stdpath("data") .. "/mason/bin"


      -- root detection
      local util = require("lspconfig.util")
      local function py_root(fname_or_buf)
        local fname = type(fname_or_buf) == "number"
          and vim.api.nvim_buf_get_name(fname_or_buf)
          or fname_or_buf
        return util.root_pattern("pyproject.toml", "setup.cfg", "setup.py", "requirements.txt", ".git")(fname)
          or vim.fn.getcwd()
      end

      -- keymaps
      local function on_attach(_, bufnr)
        local o = { buffer = bufnr, silent = true, noremap = true }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, o)
        vim.keymap.set("n", "K",  vim.lsp.buf.hover, o)
        vim.keymap.set("n", "gi", vim.lsp.buf.implementation, o)
        vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, o)
        vim.keymap.set("n", "gr", vim.lsp.buf.references, o)
        vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, o)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, o)
        vim.keymap.set("n", "<leader>cf", function() vim.lsp.buf.format({ async = true }) end, o)
        vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, o)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, o)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, o)
      end

      ----------------------------------------------------------------
      -- Ruff
      ----------------------------------------------------------------
      -- FIX: use function call, not table field
      vim.lsp.config("ruff", {
        cmd = { "/home/anirudh/.local/share/nvim/mason/bin/ruff", "server", "--preview" },
        filetypes = { "python" },
        capabilities = { positionEncodings = { "utf-8" } },
        --root_dir = function(buf) return py_root(buf) end, -- this doesn't work
        root_markers = { ".git", "pyproject.toml" },
        on_attach = function(client, bufnr)
          client.server_capabilities.hoverProvider = false -- Pyright owns hover
          on_attach(client, bufnr)
        end,
      })

      ----------------------------------------------------------------
      -- Pyright
      ----------------------------------------------------------------
      -- FIX: use function call, not table field
      vim.lsp.config("pyright", {
        cmd = { "/home/anirudh/.local/share/nvim/mason/bin/pyright-langserver", "--stdio" },
        filetypes = { "python" },
        -- root_dir = function(buf) return py_root(buf) end, -- this doesn't work
        root_markers = { ".git", "pyproject.toml" },
        capabilities = { positionEncodings = { "utf-8" } },
        on_attach = function(client, bufnr)
          client.server_capabilities.documentFormattingProvider = false
          on_attach(client, bufnr)
        end,
        settings = {
          python = {
            venvPath = ".",
            venv = ".venv",
            analysis = {
              autoSearchPaths = true,
              autoImportCompletions = true,
              diagnosticMode = "workspace",
              extraPaths = { "src" }, -- adjust to your layout
            },
          },
        },
      })

      ----------------------------------------------------------------
      -- Enable servers
      ----------------------------------------------------------------
      -- FIX: no need for FileType autocmd + start(); use enable()
      vim.lsp.enable({ "ruff", "pyright" })
    end,
  },
}
