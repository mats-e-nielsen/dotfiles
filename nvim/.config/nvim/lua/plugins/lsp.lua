return {
  "mfussenegger/nvim-dap",
  config = function()
    local dap = require("dap")
    local dapui = require("dapui")

    -- Configure codelldb adapter
    dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
        args = { "--port", "${port}" },
      },
    }

    -- Configure Zig debugging
    dap.configurations.zig = {
      {
        name = "Launch",
        type = "codelldb",
        request = "launch",
        program = "${workspaceFolder}/zig-out/bin/${workspaceFolderBasename}",
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
      },
    }

    -- -- Optional: Configure DAP UI
    -- dapui.setup({
    --   layouts = {
    --     {
    --       elements = {
    --         { id = "stacks", size = 0.25 },
    --         { id = "scopes", size = 0.25 },
    --         { id = "breakpoints", size = 0.25 },
    --         { id = "watches", size = 0.25 },
    --       },
    --       position = "left",
    --       size = 120,
    --     },
    --     {
    --       elements = {
    --         { id = "repl", size = 0.35 },
    --         { id = "console", size = 0.65 },
    --       },
    --       position = "bottom",
    --       size = 10,
    --     },
    --   },
    -- })

    dap.listeners.after.event_initialized["dapui_config_open"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config_close"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config_close"] = function()
      dapui.close()
    end
  end,
}
