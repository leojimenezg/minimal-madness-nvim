-- Entry point for minimal-madness colorscheme.

-- Reset any existing colorscheme.
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
	vim.cmd("syntax reset")
end

vim.g.colors_name = "minimal-madness"

require("minimal-madness")
