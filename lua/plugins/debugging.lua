return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio", -- REQUIRED: The new UI library needs this
    -- "leoluz/nvim-dap-go", -- REMOVED: You don't need Go support
  },
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    -- 1. ADAPTER SETUP (The part you need to add for Dart)
    dap.adapters.dart = {
      type = "executable",
      command = "dart", -- Make sure 'dart' is in your PATH
      args = { "debug_adapter" },
    }

    -- 2. DEBUG CONFIGURATIONS (Launch options)
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch Flutter App",
        program = "${workspaceFolder}/lib/main.dart",
        cwd = "${workspaceFolder}",
      },
      {
        type = "dart",
        request = "launch",
        name = "Launch Current File",
        program = "${file}",
        cwd = "${workspaceFolder}",
      },
    }

    -- 3. UI LISTENERS (Open/Close automatically)
    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- 4. KEYMAPS
    vim.keymap.set("n", "<Leader>dt", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<Leader>dc", ":DapContinue<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")
    vim.keymap.set("n", "<Leader>do", ":DapStepOver<CR>")
  end,
}
