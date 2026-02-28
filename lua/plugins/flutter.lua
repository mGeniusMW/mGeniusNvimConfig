return {
    {
        "akinsho/flutter-tools.nvim",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "stevearc/dressing.nvim", 
            "mfussenegger/nvim-dap", -- DAP wird hier benötigt
        },
        config = function()
            require("flutter-tools").setup({
                ui = {
                    border = "rounded",
                    notification_style = "plugin",
                },
                debugger = {
                    enabled = true,
                    run_via_dap = true,
                    register_configurations = function(_)
                        local dap = require("dap")

                        dap.adapters.dart = {
                            type = "executable",
                            command = "flutter",
                            args = { "debug_adapter" },
                        }

                        dap.configurations.dart = {
                            {
                                type = "dart",
                                request = "launch",
                                name = "Launch Flutter",
                                program = "${workspaceFolder}/lib/main.dart",
                                cwd = "${workspaceFolder}",
                            }
                        }
                    end,
                },
                -- Hier wird der LSP automatisch konfiguriert
                lsp = {
                    color = {
                        enabled = true,
                        background = true,
                        foreground = false, 
                    },
                    on_attach = function(client, bufnr)
                        -- Hier können deine Keymaps hin, falls du spezifische für Flutter willst
                        -- Deine globalen LSP Keymaps aus lsp-config.lua funktionieren aber auch weiterhin
                    end,
                }
            })

            require("telescope").load_extension("flutter")
        end,
    },
    {
        "dart-lang/dart-vim-plugin"
    }
}
