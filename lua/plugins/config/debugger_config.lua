-- lua/plugins/config/debugger_config.lua
local dap = require("dap")
local dapui = require ("dapui")

-- Detect OS path separator and extension
local sep = package.config:sub(1,1)
local ext = (sep == "\\") and ".exe" or ""

dapui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
dap.listeners.after.event_terminated["dapui_config"] = function() dapui.close() end
dap.listeners.after.event_exited["dapui_config"] = function() dapui.close() end

-- Try to find codelldb executable installed by Mason
local codelldb = table.concat({
  vim.fn.stdpath("data"), "mason", "packages", "codelldb",
  "extension", "adapter", "codelldb" .. ext
}, sep)

if vim.fn.executable(codelldb) == 0 then
  vim.notify("codelldb not found: " .. codelldb .. " (install via :MasonInstall codelldb)", vim.log.levels.ERROR)
  return
end

-- Register adapter
dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = { command = codelldb, args = { "--port", "${port}" } },
}

-- Ask user for executable
local function pick_prog()
  local base = vim.fn.getcwd() .. ((sep == "\\") and "\\" or "/")
  return vim.fn.input("Path to executable: ", base, "file")
end

-- Debug configuration for C / C++
dap.configurations.c = {
  {
    name = "Launch (codelldb)",
    type = "codelldb",
    request = "launch",
    program = pick_prog,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    terminal = "integrated",
  },
}
dap.configurations.cpp = dap.configurations.c

-- Minimal keymaps
vim.keymap.set("n", "<F5>",  dap.continue, {})
vim.keymap.set("n", "<F10>", dap.step_over, {})
vim.keymap.set("n", "<F11>", dap.step_into, {})
vim.keymap.set("n", "<F12>", dap.step_out, {})
vim.keymap.set("n", "<F9>",  dap.toggle_breakpoint, {})
