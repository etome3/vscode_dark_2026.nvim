-- lua/lush_theme/vscode_dark_2026.lua
--
-- VS Code Dark 2026 — a faithful Neovim port via lush.nvim
-- Covers: core Vim groups, Treesitter, LSP semantic tokens,
--         Diagnostics, rainbow-delimiters, and common LazyVim plugins.
--
-- Requires: rktjmp/lush.nvim
-- Optional: HiPhish/rainbow-delimiters.nvim (for bracket colours)
--
---@diagnostic disable: undefined-global
local lush = require("lush")
local hsl = lush.hsl

-- ── Palette ────────────────────────────────────────────────────────────────
local p = {
	-- Editor chrome
	bg = hsl("#0E0E0E"),
	bg_sidebar = hsl("#141414"),
	bg_cursorln = hsl("#1A1A1A"),
	bg_sel = hsl("#213355"),
	bg_search = hsl("#2D4F7C"),
	bg_widget = hsl("#2A2A2A"),

	-- Foregrounds
	fg = hsl("#C9D1D9"),
	fg_dim = hsl("#4E5462"),
	fg_active = hsl("#8B949E"),
	fg_border = hsl("#30363D"),

	-- Syntax
	comment = hsl("#8B949E"),
	keyword = hsl("#FF7B72"),
	control = hsl("#C586C0"),
	type_ = hsl("#4EC9B0"),
	func_user = hsl("#D2A8FF"),
	func_stdlib = hsl("#D2A8FF"),
	constant = hsl("#79C0FF"),
	macro_ = hsl("#569CD6"),
	string_ = hsl("#A5D6FF"),
	number = hsl("#B5CEA8"),
	parameter = hsl("#FFA657"),
	angle_brkt = hsl("#BBBEBF"),

	-- Diagnostics
	error_ = hsl("#F85149"),
	warn_ = hsl("#D29922"),
	info_ = hsl("#58A6FF"),
	hint_ = hsl("#B5CEA8"),

	-- Git
	git_add = hsl("#3FB950"),
	git_change = hsl("#D29922"),
	git_delete = hsl("#F85149"),

	-- Rainbow delimiters (3-colour cycle)
	rainbow1 = hsl("#FFD700"),
	rainbow2 = hsl("#DA70D6"),
	rainbow3 = hsl("#179FFF"),
}

-- ── Spec ───────────────────────────────────────────────────────────────────
-- lush injects `sym` for group names that contain special characters
-- (@, ., spaces). Without sym(), Lua's parser mistakes ["@x"] { } for a
-- key-value pair and throws '= expected near {'.
return lush(function(injected)
	local sym = injected.sym

	return {

		-- ── Core Vim highlight groups ─────────────────────────────────────────

		Normal({ bg = p.bg, fg = p.fg }),
		NormalFloat({ bg = p.bg_sidebar, fg = p.fg }),
		NormalNC({ bg = p.bg, fg = p.fg }),

		Comment({ fg = p.comment, gui = "italic" }),

		-- Literals
		Constant({ fg = p.constant }),
		String({ fg = p.string_ }),
		Character({ fg = p.string_ }),
		Number({ fg = p.number }),
		Float({ fg = p.number }),
		Boolean({ fg = p.macro_ }),

		-- Identifiers
		Identifier({ fg = p.fg }),
		Function({ fg = p.func_user }),

		-- Statements & keywords
		Statement({ fg = p.keyword }),
		Conditional({ fg = p.control }),
		Repeat({ fg = p.control }),
		Label({ fg = p.keyword }),
		Operator({ fg = p.fg }),
		Keyword({ fg = p.keyword }),
		Exception({ fg = p.control }),

		-- Preprocessor / meta
		PreProc({ fg = p.keyword }),
		Include({ fg = p.keyword }),
		Define({ fg = p.keyword }),
		Macro({ fg = p.macro_ }),
		PreCondit({ fg = p.keyword }),

		-- Types
		Type({ fg = p.type_ }),
		StorageClass({ fg = p.keyword }),
		Structure({ fg = p.type_ }),
		Typedef({ fg = p.type_ }),

		-- Special
		Special({ fg = p.func_stdlib }),
		SpecialChar({ fg = p.string_ }),
		Tag({ fg = p.constant }),
		Delimiter({ fg = p.fg }),
		SpecialComment({ fg = p.comment, gui = "bold" }),
		Debug({ fg = p.warn_ }),

		-- Misc
		Underlined({ fg = p.info_, gui = "underline" }),
		Bold({ gui = "bold" }),
		Italic({ gui = "italic" }),
		Error({ fg = p.error_ }),
		Todo({ fg = p.macro_, gui = "bold" }),
		Ignore({ fg = p.fg_dim }),

		-- ── Editor UI ─────────────────────────────────────────────────────────

		ColorColumn({ bg = p.bg_cursorln }),
		Conceal({ fg = p.fg_dim }),
		Cursor({ bg = p.fg, fg = p.bg }),
		lCursor({ bg = p.fg, fg = p.bg }),
		CursorIM({ bg = p.fg, fg = p.bg }),
		CursorLine({ bg = p.bg_cursorln }),
		CursorColumn({ bg = p.bg_cursorln }),
		CursorLineNr({ fg = p.fg_active }),
		LineNr({ fg = p.fg_dim }),
		SignColumn({ bg = p.bg, fg = p.fg_dim }),
		FoldColumn({ bg = p.bg, fg = p.fg_dim }),
		Folded({ bg = p.bg_widget, fg = p.fg_active, gui = "italic" }),

		VertSplit({ fg = p.fg_border }),
		WinSeparator({ fg = p.fg_border }),

		StatusLine({ bg = p.bg_sidebar, fg = p.fg }),
		StatusLineNC({ bg = p.bg_sidebar, fg = p.fg_active }),
		TabLine({ bg = p.bg_sidebar, fg = p.fg_active }),
		TabLineSel({ bg = p.bg, fg = p.fg, gui = "bold" }),
		TabLineFill({ bg = p.bg_sidebar }),

		Visual({ bg = p.bg_sel }),
		VisualNOS({ bg = p.bg_sel }),

		Search({ bg = p.bg_search, fg = p.fg }),
		IncSearch({ bg = p.info_, fg = p.bg, gui = "bold" }),
		Substitute({ bg = p.error_, fg = p.bg }),
		MatchParen({ bg = p.bg_widget, fg = p.fg, gui = "bold" }),

		Pmenu({ bg = p.bg_widget, fg = p.fg }),
		PmenuSel({ bg = p.bg_sel, fg = p.fg, gui = "bold" }),
		PmenuSbar({ bg = p.bg_widget }),
		PmenuThumb({ bg = p.fg_active }),

		WildMenu({ bg = p.bg_sel, fg = p.fg }),

		Directory({ fg = p.type_ }),
		Title({ fg = p.func_user, gui = "bold" }),
		EndOfBuffer({ fg = p.fg_dim }),
		NonText({ fg = p.fg_dim }),
		SpecialKey({ fg = p.fg_dim }),
		Whitespace({ fg = p.fg_dim }),

		ErrorMsg({ fg = p.error_, gui = "bold" }),
		WarningMsg({ fg = p.warn_ }),
		MoreMsg({ fg = p.git_add }),
		ModeMsg({ fg = p.fg, gui = "bold" }),
		Question({ fg = p.info_ }),

		SpellBad({ sp = p.error_, gui = "undercurl" }),
		SpellCap({ sp = p.warn_, gui = "undercurl" }),
		SpellLocal({ sp = p.info_, gui = "undercurl" }),
		SpellRare({ sp = p.hint_, gui = "undercurl" }),

		DiffAdd({ bg = hsl("#0D2010"), fg = p.git_add }),
		DiffChange({ bg = hsl("#161005"), fg = p.git_change }),
		DiffDelete({ bg = hsl("#1C0A0A"), fg = p.git_delete }),
		DiffText({ bg = hsl("#2A1F00"), fg = p.git_change, gui = "bold" }),

		QuickFixLine({ bg = p.bg_sel }),

		-- ── Diagnostics ───────────────────────────────────────────────────────

		DiagnosticError({ fg = p.error_ }),
		DiagnosticWarn({ fg = p.warn_ }),
		DiagnosticInfo({ fg = p.info_ }),
		DiagnosticHint({ fg = p.hint_ }),
		DiagnosticOk({ fg = p.git_add }),

		DiagnosticUnderlineError({ sp = p.error_, gui = "undercurl" }),
		DiagnosticUnderlineWarn({ sp = p.warn_, gui = "undercurl" }),
		DiagnosticUnderlineInfo({ sp = p.info_, gui = "undercurl" }),
		DiagnosticUnderlineHint({ sp = p.hint_, gui = "undercurl" }),

		DiagnosticVirtualTextError({ fg = p.error_, bg = hsl("#1C0A0A") }),
		DiagnosticVirtualTextWarn({ fg = p.warn_, bg = hsl("#161005") }),
		DiagnosticVirtualTextInfo({ fg = p.info_, bg = hsl("#0A0F1C") }),
		DiagnosticVirtualTextHint({ fg = p.hint_, bg = hsl("#0A1A0A") }),

		DiagnosticSignError({ fg = p.error_ }),
		DiagnosticSignWarn({ fg = p.warn_ }),
		DiagnosticSignInfo({ fg = p.info_ }),
		DiagnosticSignHint({ fg = p.hint_ }),

		DiagnosticFloatingError({ fg = p.error_ }),
		DiagnosticFloatingWarn({ fg = p.warn_ }),
		DiagnosticFloatingInfo({ fg = p.info_ }),
		DiagnosticFloatingHint({ fg = p.hint_ }),

		-- ── Treesitter ────────────────────────────────────────────────────────
		-- sym("@group.name") is required for any name with @ or . in it.

		-- Variables
		sym("@variable")({ fg = p.fg }),
		sym("@variable.builtin")({ fg = p.keyword }),
		sym("@variable.parameter")({ fg = p.parameter }),
		sym("@variable.parameter.builtin")({ fg = p.keyword }),
		sym("@variable.member")({ fg = p.fg }),

		-- Constants
		sym("@constant")({ fg = p.constant }),
		sym("@constant.builtin")({ fg = p.macro_ }),
		sym("@constant.macro")({ fg = p.macro_ }),

		-- Modules / namespaces
		sym("@module")({ fg = p.type_ }),
		sym("@module.builtin")({ fg = p.type_ }),
		sym("@label")({ fg = p.constant }),

		-- Literals
		sym("@string")({ fg = p.string_ }),
		sym("@string.documentation")({ fg = p.comment, gui = "italic" }),
		sym("@string.regexp")({ fg = p.string_ }),
		sym("@string.escape")({ fg = p.keyword }),
		sym("@string.special")({ fg = p.string_ }),
		sym("@string.special.url")({ fg = p.info_, gui = "underline" }),
		sym("@string.special.symbol")({ fg = p.constant }),

		sym("@character")({ fg = p.string_ }),
		sym("@character.special")({ fg = p.keyword }),

		sym("@number")({ fg = p.number }),
		sym("@number.float")({ fg = p.number }),

		-- Types
		sym("@type")({ fg = p.type_ }),
		sym("@type.builtin")({ fg = p.type_ }),
		sym("@type.definition")({ fg = p.type_ }),

		-- Attributes / decorators
		sym("@attribute")({ fg = p.keyword }),
		sym("@attribute.builtin")({ fg = p.keyword }),
		sym("@property")({ fg = p.fg }),

		-- Functions
		sym("@function")({ fg = p.func_user }),
		sym("@function.builtin")({ fg = p.func_stdlib }),
		sym("@function.call")({ fg = p.func_user }),
		sym("@function.macro")({ fg = p.macro_ }),
		sym("@function.method")({ fg = p.func_user }),
		sym("@function.method.call")({ fg = p.func_user }),
		sym("@method")({ fg = p.func_user }),
		sym("@method.call")({ fg = p.func_user }),

		-- Keywords
		sym("@keyword")({ fg = p.keyword }),
		sym("@keyword.coroutine")({ fg = p.keyword }),
		sym("@keyword.function")({ fg = p.keyword }),
		sym("@keyword.operator")({ fg = p.keyword }),
		sym("@keyword.import")({ fg = p.keyword }),
		sym("@keyword.type")({ fg = p.keyword }),
		sym("@keyword.modifier")({ fg = p.keyword }),
		sym("@keyword.repeat")({ fg = p.control }),
		sym("@keyword.return")({ fg = p.control }),
		sym("@keyword.debug")({ fg = p.warn_ }),
		sym("@keyword.exception")({ fg = p.control }),
		sym("@keyword.conditional")({ fg = p.control }),
		sym("@keyword.conditional.ternary")({ fg = p.control }),
		sym("@keyword.directive")({ fg = p.keyword }),
		sym("@keyword.directive.define")({ fg = p.keyword }),

		-- Punctuation
		sym("@punctuation.delimiter")({ fg = p.fg }),
		sym("@punctuation.bracket")({ fg = p.fg }),
		sym("@punctuation.special")({ fg = p.fg }),

		-- Comments
		sym("@comment")({ fg = p.comment, gui = "italic" }),
		sym("@comment.documentation")({ fg = p.comment, gui = "italic" }),
		sym("@comment.error")({ fg = p.error_, gui = "bold" }),
		sym("@comment.warning")({ fg = p.warn_, gui = "bold" }),
		sym("@comment.todo")({ fg = p.macro_, gui = "bold" }),
		sym("@comment.note")({ fg = p.info_, gui = "bold" }),

		-- Markup (markdown etc.)
		sym("@markup.strong")({ gui = "bold" }),
		sym("@markup.italic")({ gui = "italic" }),
		sym("@markup.strikethrough")({ gui = "strikethrough" }),
		sym("@markup.underline")({ gui = "underline" }),
		sym("@markup.heading")({ fg = p.func_user, gui = "bold" }),
		sym("@markup.heading.1")({ fg = p.keyword, gui = "bold" }),
		sym("@markup.heading.2")({ fg = p.func_user, gui = "bold" }),
		sym("@markup.heading.3")({ fg = p.type_, gui = "bold" }),
		sym("@markup.heading.4")({ fg = p.constant, gui = "bold" }),
		sym("@markup.heading.5")({ fg = p.macro_, gui = "bold" }),
		sym("@markup.heading.6")({ fg = p.func_stdlib, gui = "bold" }),
		sym("@markup.quote")({ fg = p.comment, gui = "italic" }),
		sym("@markup.math")({ fg = p.number }),
		sym("@markup.link")({ fg = p.info_ }),
		sym("@markup.link.label")({ fg = p.func_user }),
		sym("@markup.link.url")({ fg = p.info_, gui = "underline" }),
		sym("@markup.raw")({ fg = p.string_ }),
		sym("@markup.raw.block")({ fg = p.string_ }),
		sym("@markup.list")({ fg = p.keyword }),
		sym("@markup.list.checked")({ fg = p.git_add }),
		sym("@markup.list.unchecked")({ fg = p.fg_active }),

		-- Diff (TS)
		sym("@diff.plus")({ fg = p.git_add }),
		sym("@diff.minus")({ fg = p.git_delete }),
		sym("@diff.delta")({ fg = p.git_change }),

		-- Tags (HTML/JSX)
		sym("@tag")({ fg = p.keyword }),
		sym("@tag.builtin")({ fg = p.keyword }),
		sym("@tag.attribute")({ fg = p.parameter }),
		sym("@tag.delimiter")({ fg = p.fg }),

		-- ── LSP semantic tokens ───────────────────────────────────────────────

		sym("@lsp.type.class")({ fg = p.type_ }),
		sym("@lsp.type.comment")({ fg = p.comment, gui = "italic" }),
		sym("@lsp.type.decorator")({ fg = p.func_user }),
		sym("@lsp.type.enum")({ fg = p.type_ }),
		sym("@lsp.type.enumMember")({ fg = p.constant }),
		sym("@lsp.type.event")({ fg = p.type_ }),
		sym("@lsp.type.function")({ fg = p.func_user }),
		sym("@lsp.type.interface")({ fg = p.type_ }),
		sym("@lsp.type.keyword")({ fg = p.keyword }),
		sym("@lsp.type.macro")({ fg = p.macro_ }),
		sym("@lsp.type.method")({ fg = p.func_user }),
		sym("@lsp.type.modifier")({ fg = p.keyword }),
		sym("@lsp.type.namespace")({ fg = p.type_ }),
		sym("@lsp.type.number")({ fg = p.number }),
		sym("@lsp.type.operator")({ fg = p.fg }),
		sym("@lsp.type.parameter")({ fg = p.parameter }),
		sym("@lsp.type.property")({ fg = p.fg }),
		sym("@lsp.type.regexp")({ fg = p.string_ }),
		sym("@lsp.type.string")({ fg = p.string_ }),
		sym("@lsp.type.struct")({ fg = p.type_ }),
		sym("@lsp.type.type")({ fg = p.type_ }),
		sym("@lsp.type.typeParameter")({ fg = p.type_ }),
		sym("@lsp.type.variable")({ fg = p.fg }),

		-- Modifiers — key for stdlib vs user-defined distinction
		sym("@lsp.typemod.function.defaultLibrary")({ fg = p.func_stdlib }),
		sym("@lsp.typemod.method.defaultLibrary")({ fg = p.func_stdlib }),
		sym("@lsp.typemod.variable.defaultLibrary")({ fg = p.func_stdlib }),
		sym("@lsp.typemod.function.readonly")({ fg = p.func_user, gui = "italic" }),
		sym("@lsp.typemod.variable.readonly")({ fg = p.constant }),
		sym("@lsp.typemod.variable.static")({ fg = p.constant }),

		-- ── Git signs (lewis6991/gitsigns.nvim) ───────────────────────────────

		GitSignsAdd({ fg = p.git_add, bg = p.bg }),
		GitSignsChange({ fg = p.git_change, bg = p.bg }),
		GitSignsDelete({ fg = p.git_delete, bg = p.bg }),
		GitSignsAddNr({ fg = p.git_add }),
		GitSignsChangeNr({ fg = p.git_change }),
		GitSignsDeleteNr({ fg = p.git_delete }),
		GitSignsAddLn({ bg = hsl("#0D2010") }),
		GitSignsChangeLn({ bg = hsl("#161005") }),
		GitSignsDeleteLn({ bg = hsl("#1C0A0A") }),

		-- ── Telescope ─────────────────────────────────────────────────────────

		TelescopeBorder({ fg = p.fg_border, bg = p.bg_sidebar }),
		TelescopeNormal({ bg = p.bg_sidebar, fg = p.fg }),
		TelescopePromptNormal({ bg = p.bg_widget, fg = p.fg }),
		TelescopePromptBorder({ fg = p.fg_border, bg = p.bg_widget }),
		TelescopePromptTitle({ fg = p.keyword, gui = "bold" }),
		TelescopePreviewTitle({ fg = p.type_, gui = "bold" }),
		TelescopeResultsTitle({ fg = p.func_user, gui = "bold" }),
		TelescopeSelection({ bg = p.bg_sel, fg = p.fg }),
		TelescopeSelectionCaret({ fg = p.keyword }),
		TelescopeMatching({ fg = p.func_stdlib, gui = "bold" }),

		-- ── neo-tree ──────────────────────────────────────────────────────────

		NeoTreeNormal({ bg = p.bg_sidebar, fg = p.fg }),
		NeoTreeNormalNC({ bg = p.bg_sidebar, fg = p.fg }),
		NeoTreeDirectoryName({ fg = p.fg }),
		NeoTreeDirectoryIcon({ fg = p.macro_ }),
		NeoTreeRootName({ fg = p.keyword, gui = "bold" }),
		NeoTreeFileName({ fg = p.fg }),
		NeoTreeFileIcon({ fg = p.fg_active }),
		NeoTreeGitAdded({ fg = p.git_add }),
		NeoTreeGitModified({ fg = p.git_change }),
		NeoTreeGitDeleted({ fg = p.git_delete }),
		NeoTreeGitUntracked({ fg = p.fg_active }),
		NeoTreeIndentMarker({ fg = p.fg_dim }),
		NeoTreeSymbolicLinkTarget({ fg = p.type_ }),
		NeoTreeTitleBar({ bg = p.macro_, fg = p.bg, gui = "bold" }),
		NeoTreeFloatBorder({ fg = p.fg_border }),
		NeoTreeTabActive({ bg = p.bg, fg = p.fg, gui = "bold" }),
		NeoTreeTabInactive({ bg = p.bg_sidebar, fg = p.fg_active }),

		-- ── which-key ─────────────────────────────────────────────────────────

		WhichKey({ fg = p.keyword }),
		WhichKeyGroup({ fg = p.type_ }),
		WhichKeyDesc({ fg = p.fg }),
		WhichKeySeperator({ fg = p.fg_dim }),
		WhichKeyFloat({ bg = p.bg_sidebar }),
		WhichKeyBorder({ fg = p.fg_border }),
		WhichKeyValue({ fg = p.func_stdlib }),

		-- ── nvim-cmp ──────────────────────────────────────────────────────────

		CmpItemAbbr({ fg = p.fg }),
		CmpItemAbbrMatch({ fg = p.func_stdlib, gui = "bold" }),
		CmpItemAbbrMatchFuzzy({ fg = p.func_stdlib, gui = "bold" }),
		CmpItemAbbrDeprecated({ fg = p.fg_dim, gui = "strikethrough" }),
		CmpItemMenu({ fg = p.fg_active }),
		CmpItemKindText({ fg = p.fg }),
		CmpItemKindMethod({ fg = p.func_user }),
		CmpItemKindFunction({ fg = p.func_user }),
		CmpItemKindConstructor({ fg = p.type_ }),
		CmpItemKindField({ fg = p.fg }),
		CmpItemKindVariable({ fg = p.fg }),
		CmpItemKindClass({ fg = p.type_ }),
		CmpItemKindInterface({ fg = p.type_ }),
		CmpItemKindModule({ fg = p.type_ }),
		CmpItemKindProperty({ fg = p.fg }),
		CmpItemKindUnit({ fg = p.number }),
		CmpItemKindValue({ fg = p.constant }),
		CmpItemKindEnum({ fg = p.type_ }),
		CmpItemKindKeyword({ fg = p.keyword }),
		CmpItemKindSnippet({ fg = p.macro_ }),
		CmpItemKindColor({ fg = p.string_ }),
		CmpItemKindFile({ fg = p.fg_active }),
		CmpItemKindReference({ fg = p.constant }),
		CmpItemKindFolder({ fg = p.fg_active }),
		CmpItemKindEnumMember({ fg = p.constant }),
		CmpItemKindConstant({ fg = p.constant }),
		CmpItemKindStruct({ fg = p.type_ }),
		CmpItemKindEvent({ fg = p.type_ }),
		CmpItemKindOperator({ fg = p.fg }),
		CmpItemKindTypeParameter({ fg = p.type_ }),

		-- ── indent-blankline ──────────────────────────────────────────────────

		IblIndent({ fg = hsl("#1E1E1E") }),
		IblScope({ fg = hsl("#3D3D3D") }),

		-- ── flash.nvim ────────────────────────────────────────────────────────

		FlashBackdrop({ fg = p.fg_dim }),
		FlashMatch({ bg = p.bg_search, fg = p.fg }),
		FlashCurrent({ bg = p.info_, fg = p.bg, gui = "bold" }),
		FlashLabel({ bg = p.keyword, fg = p.bg, gui = "bold" }),

		-- ── Noice ─────────────────────────────────────────────────────────────

		NoiceVirtualText({ fg = p.fg_active }),
		NoiceCmdline({ fg = p.fg, bg = p.bg_widget }),
		NoicePopup({ bg = p.bg_sidebar }),
		NoicePopupBorder({ fg = p.fg_border, bg = p.bg_sidebar }),
		NoiceConfirm({ bg = p.bg_sidebar }),

		-- ── Rainbow delimiters ────────────────────────────────────────────────

		RainbowDelimiter1({ fg = p.rainbow1 }),
		RainbowDelimiter2({ fg = p.rainbow2 }),
		RainbowDelimiter3({ fg = p.rainbow3 }),
		RainbowDelimiter4({ fg = p.rainbow1 }),
		RainbowDelimiter5({ fg = p.rainbow2 }),
		RainbowDelimiter6({ fg = p.rainbow3 }),
		RainbowDelimiter7({ fg = p.rainbow1 }),
	}
end)
