require("auto-save").setup({
    enabled = true,
    execution_message = {
        message = function()
            return ""
        end,
    },
    debounce_delay = 1000,
    events = { "InsertLeave" },
})
