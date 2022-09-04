local status_ok, neotest = pcall(require, "neotest")
if not status_ok then
	return
end

neotest.setup({
	adapters = {
		require("neotest-python")({
			dap = { justMyCode = false },
		}),
		require("neotest-rust"),
	},
})

vim.api.nvim_create_user_command("TestNearestWithExtraArgs", function(opts)
	neotest.run.run({vim.fn.expand("%"), extra_args = opts["fargs"] })
end, {
	nargs = "*",
})

vim.api.nvim_create_user_command("DebugNearestWithExtraArgs", function(opts)
	neotest.run.run({vim.fn.expand("%"), extra_args = opts["fargs"], strategy = "dap"})
end, {
	nargs = "*",
})
