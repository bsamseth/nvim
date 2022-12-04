require("project_nvim").setup({
	detection_methods = { "pattern" },
	patterns = { ".git", "Makefile", "package.json", "pyproject.toml" },
})
require("telescope").load_extension("projects")
