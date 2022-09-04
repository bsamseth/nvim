local status_ok, betterescape = pcall(require, "better_escape")
if not status_ok then
	return
end

betterescape.setup({ mapping = { "jk" } })
