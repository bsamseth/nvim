require("auto-save").setup({
	enabled = false,
	execution_message = {
		message = function()
			return ""
		end,
	},
	debounce_delay = 500,
	events = { "InsertLeave" },
})
