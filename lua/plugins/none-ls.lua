return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                null_ls.builtins.diagnostics.erb_lint,
                null_ls.builtins.formatting.black,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.diagnostics.pylint,
            },
        })

        -- Keymap to format only using null-ls (Prettier, Stylua, etc.)
        vim.keymap.set("n", "<leader>gf", function()
            vim.lsp.buf.format({
                filter = function(client)
                    -- Only allow null-ls to format
                    return client.name == "null-ls"
                end,
            })
        end, {})
    end,
}
