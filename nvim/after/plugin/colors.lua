function SetColorScheme(color)
	color = color or "slate"
	vim.cmd.colorscheme("slate") -- supposed to be color but does not work for me...

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

SetColorScheme()
