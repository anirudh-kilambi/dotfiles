return {
    {
        'williamboman/mason.nvim',
        config = function()
            require('mason').setup()
        end,
    },
    {
        'williamboman/mason-lspconfig.nvim',
        dependencies = { 'williamboman/mason.nvim' },
        config = function()
            require('mason-lspconfig').setup({
                ensure_installed = { 'ruff', 'pyright' },
            })
            
            -- Common on_attach function for LSP keymaps
            local function on_attach(client, bufnr)
                local opts = { buffer = bufnr, noremap = true, silent = true }
                
                -- Navigation
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
                
                -- Code actions
                vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                vim.keymap.set('n', '<leader>cf', vim.lsp.buf.format, opts)
                
                -- Diagnostics
                vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float, opts)
                vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
                vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
            end
            
            -- Configure Ruff using the new built-in LSP server
            vim.lsp.config.ruff = {
                cmd = { 'ruff', 'server', '--preview' },
                filetypes = { 'python' },
                on_attach = function(client, bufnr)
                    -- Disable hover in favor of Pyright
                    client.server_capabilities.hoverProvider = false
                    -- Disable diagnostics in favor of Pyright for type errors
                    client.server_capabilities.diagnosticProvider = true
                    on_attach(client, bufnr)
                end,
                settings = {}
            }
            
            -- Configure Pyright using vim.lsp.config
            vim.lsp.config.pyright = {
                cmd = { 'pyright-langserver', '--stdio' },
                filetypes = { 'python' },
                on_attach = function(client, bufnr)
                    -- Pyright handles hover, definitions, and type checking
                    client.server_capabilities.documentFormattingProvider = false
                    on_attach(client, bufnr)
                end,
                settings = {
                    python = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                        }
                    }
                }
            }
            
            -- Auto-start LSP servers for Python files
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'python',
                callback = function(args)
                    vim.lsp.start({ name = 'ruff', bufnr = args.buf })
                    vim.lsp.start({ name = 'pyright', bufnr = args.buf })
                end,
            })
        end,
    }
}
