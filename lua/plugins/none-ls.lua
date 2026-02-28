return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "jay-babu/mason-null-ls.nvim", -- The bridge plugin
    },
    config = function()
        local null_ls = require("null-ls")
        local mason_null_ls = require("mason-null-ls")

        -- 1. Setup the bridge first
        mason_null_ls.setup({
            ensure_installed = { "stylua", "prettier", "black", "cfn_lint" },
            automatic_installation = true, -- This is the magic "Auto" part
        })

        -- 2. Setup none-ls
        null_ls.setup({
            sources = {
                -- You can leave this empty or add specific ones
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.cfn_lint,
            },
        })
    end,
}
