local dap = require("dap")
dap.adapters.node2 = {
	type = "executable",
	command = "node",
	args = { os.getenv("HOME") .. "/sources/vscode-node-debug2/out/src/nodeDebug.js" },
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

require("dapui").setup()
