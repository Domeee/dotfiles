local dap, dapui = require("dap"), require("dapui")

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function ()
  dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function ()
  dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function ()
  dapui.close()
end

dap.adapters.godot = {
  type = "server",
  host = "127.0.0.1",
  port = 6006,
}

dap.configurations.gdscript = {
  {
    type = "godot",
    request = "launch",
    name = "Launch scene",
    project = "${workspaceFolder}"
  }
}

vim.fn.sign_define("DapBreakpoint",
  { text = "•", texthl = "DapBreakpointText", linehl = "DapBreakpointLine", numhl = "DapBreakpointNumber" })

vim.fn.sign_define("DapBreakpointCondition", {
  text = "•",
  texthl = "DapBreakpointConditionText",
  linehl = "DapBreakpointConditionLine",
  numhl = "DapBreakpointConditionNumber"
})

vim.fn.sign_define("DapBreakpointRejected", {
  text = "•",
  texthl = "DapBreakpointRejectedText",
  linehl = "DapBreakpointRejectedLine",
  numhl = "DapBreakpointRejectedNumber"
})

vim.fn.sign_define("DapStopped",
  { text = "→", texthl = "DapStoppedText", linehl = "DapStoppedLine", numhl = "DapStoppedNumber" })

vim.fn.sign_define("DapLogPoint",
  { text = "≡", texthl = "DapLogPointText", linehl = "DapLogPointLine", numhl = "DapLogPointNumber" })

dapui.setup({
  icons = {
    collapsed = "⮝",
    current_frame = "→",
    expanded = "⮞"
  },
  layouts = { {
    elements = { {
      id = "stacks",
      size = 0.25
    }, {
      id = "scopes",
      size = 0.5
    }, {
      id = "watches",
      size = 0.25
    } },
    position = "left",
    size = 40
  } },
  mappings = {
    edit = "e",
    expand = { "<CR>" },
    open = "o",
    remove = "d",
    repl = "r",
    toggle = "t"
  },
})
