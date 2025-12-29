return {

    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            auto_install = true,
            ensure_installed = { "lua_ls", "ts_ls", "jdtls" },
        },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()

            vim.lsp.config("lua_ls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("lua_ls")

            vim.lsp.config("ts_ls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("ts_ls")

            vim.lsp.config("dartls", {
                cmd = { "dart", "language-server", "--protocol=lsp" },
                capabilities = capabilities,
            })
            vim.lsp.enable("dartls")

            vim.lsp.config("jdtls", {
                capabilities = capabilities,
            })
            vim.lsp.enable("jdtls")

            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
        end,
    },
}
