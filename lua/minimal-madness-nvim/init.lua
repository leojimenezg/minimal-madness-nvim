local M = {}

M.config = {
	styles = {
		comments = { italic = true },
		keywords = { italic = false },
		functions = { italic = false, bold = false },
		variables = { italic = false },
		headings = { bold = false },
	},
	transparent_background = false,
	overrides = {},  -- Override existing colors.
}

local function apply_style(base, style_config)
	local result = vim.tbl_deep_extend("force", base, style_config or {})
	return result
end

function M.load()
	local colors = require("minimal-madness-nvim.colors")
	colors = vim.tbl_deep_extend("force", colors, M.config.overrides)  -- Combine colors.
	vim.cmd("highlight clear")
	if vim.fn.exists("syntax_on") then
		vim.cmd("syntax reset")
	end
	vim.g.colors_name = "minimal-madness-nvim"
	local bg_color = M.config.transparent_background and "NONE" or colors.bg
	local styles = M.config.styles

	-- Treesitter highlight groups.
	vim.api.nvim_set_hl(0, "@variable", apply_style({ fg = colors.white }, styles.variables))
	vim.api.nvim_set_hl(0, "@variable.builtin", apply_style({ fg = colors.yellow }, styles.variables))
	vim.api.nvim_set_hl(0, "@variable.parameter", apply_style({ fg = colors.white }, styles.variables))
	vim.api.nvim_set_hl(0, "@variable.member", apply_style({ fg = colors.white }, styles.variables))
	vim.api.nvim_set_hl(0, "@constant", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@constant.builtin", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@constant.macro", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@module", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@module.builtin", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@label", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@string", { fg = colors.green })
	vim.api.nvim_set_hl(0, "@string.documentation", { fg = colors.grey })
	vim.api.nvim_set_hl(0, "@string.regexp", { fg = colors.orange })
	vim.api.nvim_set_hl(0, "@string.escape", { fg = colors.light_grey })
	vim.api.nvim_set_hl(0, "@string.special", { fg = colors.green })
	vim.api.nvim_set_hl(0, "@string.special.symbol", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@string.special.url", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "@string.special.path", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "@character", { fg = colors.green })
	vim.api.nvim_set_hl(0, "@character.special", { fg = colors.light_grey })
	vim.api.nvim_set_hl(0, "@boolean", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@number", { fg = colors.orange })
	vim.api.nvim_set_hl(0, "@number.float", { fg = colors.orange })
	vim.api.nvim_set_hl(0, "@type", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@type.builtin", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@type.definition", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@attribute", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@attribute.builtin", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@property", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@function", apply_style({ fg = colors.white }, styles.functions))
	vim.api.nvim_set_hl(0, "@function.builtin", apply_style({ fg = colors.yellow }, styles.functions))
	vim.api.nvim_set_hl(0, "@function.call", apply_style({ fg = colors.white }, styles.functions))
	vim.api.nvim_set_hl(0, "@function.macro", apply_style({ fg = colors.white }, styles.functions))
	vim.api.nvim_set_hl(0, "@function.method", apply_style({ fg = colors.white }, styles.functions))
	vim.api.nvim_set_hl(0, "@function.method.call", apply_style({ fg = colors.white }, styles.functions))
	vim.api.nvim_set_hl(0, "@constructor", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@operator", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@keyword", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.coroutine", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.function", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.operator", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.import", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.type", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.modifier", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.repeat", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.return", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.debug", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.exception", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.conditional", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.conditional.ternary", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.directive", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@keyword.directive.define", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "@punctuation.delimiter", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@punctuation.bracket", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@punctuation.special", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@comment", apply_style({ fg = colors.grey }, styles.comments))
	vim.api.nvim_set_hl(0, "@comment.documentation", apply_style({ fg = colors.grey }, styles.comments))
	vim.api.nvim_set_hl(0, "@comment.error", apply_style({ fg = colors.red }, styles.comments))
	vim.api.nvim_set_hl(0, "@comment.warning", apply_style({ fg = colors.red }, styles.comments))
	vim.api.nvim_set_hl(0, "@comment.todo", apply_style({ fg = colors.pink }, styles.comments))
	vim.api.nvim_set_hl(0, "@comment.note", apply_style({ fg = colors.pink }, styles.comments))
	vim.api.nvim_set_hl(0, "@markup.strong", { bold = true })
	vim.api.nvim_set_hl(0, "@markup.italic", { italic = true })
	vim.api.nvim_set_hl(0, "@markup.strikethrough", { strikethrough = true })
	vim.api.nvim_set_hl(0, "@markup.underline", { underline = true })
	vim.api.nvim_set_hl(0, "@markup.heading", apply_style({ fg = colors.yellow }, styles.headings))
	vim.api.nvim_set_hl(0, "@markup.heading.1", apply_style({ fg = colors.yellow }, styles.headings))
	vim.api.nvim_set_hl(0, "@markup.heading.2", apply_style({ fg = colors.yellow }, styles.headings))
	vim.api.nvim_set_hl(0, "@markup.heading.3", apply_style({ fg = colors.yellow }, styles.headings))
	vim.api.nvim_set_hl(0, "@markup.heading.4", apply_style({ fg = colors.yellow }, styles.headings))
	vim.api.nvim_set_hl(0, "@markup.heading.5", apply_style({ fg = colors.yellow }, styles.headings))
	vim.api.nvim_set_hl(0, "@markup.heading.6", apply_style({ fg = colors.yellow }, styles.headings))
	vim.api.nvim_set_hl(0, "@markup.quote", { fg = colors.grey, italic = true })
	vim.api.nvim_set_hl(0, "@markup.math", { fg = colors.light_grey })
	vim.api.nvim_set_hl(0, "@markup.link", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@markup.link.label", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@markup.link.url", { fg = colors.blue, underline = true })
	vim.api.nvim_set_hl(0, "@markup.raw", { fg = colors.light_grey })
	vim.api.nvim_set_hl(0, "@markup.raw.block", { fg = colors.light_grey })
	vim.api.nvim_set_hl(0, "@markup.list", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@markup.list.checked", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@markup.list.unchecked", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@diff.plus", { fg = colors.glowing_green })
	vim.api.nvim_set_hl(0, "@diff.minus", { fg = colors.glowing_red })
	vim.api.nvim_set_hl(0, "@diff.delta", { fg = colors.glowing_blue })
	vim.api.nvim_set_hl(0, "@tag", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@tag.builtin", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "@tag.attribute", { fg = colors.white })
	vim.api.nvim_set_hl(0, "@tag.delimiter", { fg = colors.white })

	-- Language highlight groups.

	-- Neovim base highlight groups.
	vim.api.nvim_set_hl(0, "Normal", { fg = colors.white, bg = bg_color })
	vim.api.nvim_set_hl(0, "Comment", apply_style({ fg = colors.grey }, styles.comments))
	vim.api.nvim_set_hl(0, "Constant", { fg = colors.white })
	vim.api.nvim_set_hl(0, "String", { fg = colors.green })
	vim.api.nvim_set_hl(0, "Character", { fg = colors.green })
	vim.api.nvim_set_hl(0, "Number", { fg = colors.orange })
	vim.api.nvim_set_hl(0, "Boolean", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Float", { fg = colors.orange })
	vim.api.nvim_set_hl(0, "Identifier", { fg = colors.white })
	vim.api.nvim_set_hl(0, "Function", apply_style({ fg = colors.white }, styles.functions))
	vim.api.nvim_set_hl(0, "Statement", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Conditional", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Repeat", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Label", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Operator", { fg = colors.white })
	vim.api.nvim_set_hl(0, "Keyword", apply_style({ fg = colors.yellow }, styles.keywords))
	vim.api.nvim_set_hl(0, "Exception", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "PreProc", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Include", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Define", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "PreCondit", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Type", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "StorageClass", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Structure", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Typedef", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Special", { fg = colors.light_grey })
	vim.api.nvim_set_hl(0, "SpecialChar", { fg = colors.light_grey })
	vim.api.nvim_set_hl(0, "Tag", { fg = colors.yellow })
	vim.api.nvim_set_hl(0, "Delimiter", { fg = colors.white })
	vim.api.nvim_set_hl(0, "SpecialComment", apply_style({ fg = colors.pink }, styles.comments))
	vim.api.nvim_set_hl(0, "Debug", { fg = colors.white })
	vim.api.nvim_set_hl(0, "Underlined", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "Ignore", { fg = colors.white })
	vim.api.nvim_set_hl(0, "Error", { fg = colors.red })
	vim.api.nvim_set_hl(0, "Todo", { fg = colors.pink })
	vim.api.nvim_set_hl(0, "Added", { fg = colors.glowing_green })
	vim.api.nvim_set_hl(0, "Changed", { fg = colors.glowing_blue })
	vim.api.nvim_set_hl(0, "Removed", { fg = colors.glowing_red })

	-- Special neovim sections.
	vim.api.nvim_set_hl(0, "StatusLine", { fg = colors.light_grey, bg = colors.grey })
	vim.api.nvim_set_hl(0, "StatusLineNC", { fg = colors.grey, bg = colors.grey })
	vim.api.nvim_set_hl(0, "Directory", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "netrwDir", { fg = colors.blue })
	vim.api.nvim_set_hl(0, "netrwPlain", { fg = colors.white })
end

function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

return M
