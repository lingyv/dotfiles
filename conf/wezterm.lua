local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- 字体配置
config.font = wezterm.font({
	family = "FiraCode Nerd Font Mono",
	weight = "Regular",
	harfbuzz_features = { "calt=1", "clig=1", "liga=1" },
})
config.font_size = 15.0
config.line_height = 1.0

-- 配置字体回退链
config.font = wezterm.font_with_fallback({
	"JetBrains Mono",
	"Hack Nerd Font",
	"NotoSans Nerd Font",
	"Heiti SC",
	"Fira Code",
	"Noto Color Emoji",
	"Noto Sans CJK JP",
	"Noto Sans CJK KR",
	"Symbols Nerd Font",
})

-- 窗口装饰/背景配置
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS"
config.window_background_opacity = 0.96

-- 背景颜色
local colors = {
	background = "#212020",
}

config.background = {
	{
		source = { Color = colors.background },
		height = "100%",
		width = "100%",
		opacity = 0.8,
	},
}

-- 自定义按键映射：Shift + Esc 发送 ~ 字符
config.keys = {
	{
		key = "Escape",
		mods = "SHIFT",
		action = wezterm.action.SendString("~"),
	},
	-- Ctrl+V 粘贴
	{
		key = "v",
		mods = "CTRL",
		action = wezterm.action.PasteFrom("Clipboard"),
	},
	-- Ctrl+C 复制
	{
		key = "c",
		mods = "CTRL",
		action = wezterm.action.CopyTo("Clipboard"),
	},
}

return config