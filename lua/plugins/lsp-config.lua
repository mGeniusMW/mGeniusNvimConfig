return {
    -- 1. The Detection Plugin
    {
        "cwrau/yaml-schema-detect.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {}, 
        ft = { "yaml", "helm" },
    },

    -- 2. Mason Setup
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    -- 3. Mason LSP Config & The "Secret Sauce" Loop
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        config = function()
            local mason_lspconfig = require("mason-lspconfig")
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            mason_lspconfig.setup({
                -- Add yamlls here so it installs automatically
                ensure_installed = { "lua_ls", "ts_ls", "jdtls", "yamlls" },
                auto_install = true,
            })

            local function auto_setup_servers()
                for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
                    local config = { capabilities = capabilities }

                    -- Specific logic for YAML Detection
                    if server == "yamlls" then
                        config.settings = {
                            yaml = {
                                -- Disable built-in store so the plugin can take over
                                schemaStore = { enable = false, url = "" },
                            },
                        }
                    end

                    if server == "dartls" then
                        vim.lsp.config("dartls", {
                            cmd = { "dart", "language-server", "--protocol=lsp" },
                            capabilities = capabilities,
                        })
                    else
                        -- Apply the config (including the YAML settings if applicable)
                        vim.lsp.config(server, config)
                    end
                    vim.lsp.enable(server)
                end
            end

            auto_setup_servers()

            vim.api.nvim_create_autocmd("User", {
                pattern = "MasonToolsUpdateCompleted",
                callback = auto_setup_servers,
            })
        end,
    },

    -- 4. General LSP Keymaps
    {
        "neovim/nvim-lspconfig",
        config = function()
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
            vim.keymap.set("n", "<leader>f", function() 
                vim.lsp.buf.format { async = true } 
            end, { desc = "Format Code" })
        end,
    },
}
