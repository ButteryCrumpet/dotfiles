local dap = require("dap")
local dapui = require("dapui")

dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/sources/vscode-node-debug2/out/src/nodeDebug.js" },
}

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}

dap.configurations.typescript = {
	{
		name = "Launch",
		type = "node2",
		request = "launch",
		program = "${file}",
		cwd = vim.fn.getcwd(),
		sourceMaps = true,
		protocol = "inspector",
		console = "integratedTerminal",
	},
	{
		name = "Attach to process",
		type = "node2",
		request = "attach",
		protocol = "inspector",
		console = "integratedTerminal",
		processId = require("dap.utils").pick_process,
	},
}

dap.configurations.zig = {
	{
		ame = "Launch",
		type = "gdb",
		program = "${file}",
		request = "launch",
		protocol = "inspector",
		console = "integratedTerminal",
	},
}

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end

require("dapui").setup()
