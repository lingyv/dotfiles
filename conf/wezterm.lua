local wezterm = require("wezterm")
local config = wezterm.config_builder()
local action = wezterm.action

-- 字体配置（修复了 weight 非法值 + 保持禁用连字）
config.font = wezterm.font({
	family = "FiraCode Nerd Font Mono",
	weight = "Regular", -- 合法值：Regular/Bold/Light/Medium 或数字 100-900
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
	"Apple Color Emoji", -- Emoji支持
	"Noto Sans CJK JP", -- 日文支持
	"Noto Sans CJK KR", -- 韩文支持
	"Symbols Nerd Font", -- 图标支持
})

-- 窗口装饰/背景配置（全部修正为合法属性名）
config.window_decorations = "RESIZE|INTEGRATED_BUTTONS" -- 核心修复：添加下划线
config.window_background_opacity = 0.96 -- 正确命名（蛇形）
-- 窗口背景模糊（保持原配置）
config.macos_window_background_blur = 20

-- （可选）如果用到了 colors.background，需要先定义颜色表
local colors = {
	background = "#212020", -- 示例：这里填你实际的背景色值
}

-- 修复 background 结构：WezTerm 的 background 是「单层级数组」，无需额外嵌套
config.background = {
	{
		source = { Color = colors.background }, -- 依赖上面定义的 colors 变量
		height = "100%",
		width = "100%",
		opacity = 0.8,
	},
}

-- 自定义按键映射：Shift + Esc 发送 ~ 字符
config.keys = {
	{
		key = "Escape", -- 触发按键：Esc
		mods = "SHIFT", -- 修饰键：Shift
		action = wezterm.action.SendString("~"), -- 执行动作：发送 ~ 字符
	},
	-- Cmd+V 粘贴
	{
		key = "v", -- 注意：key 只写单个字符，修饰键放在 mods 里
		mods = "CMD",
		action = wezterm.action.PasteFrom("Clipboard"), -- 更标准的 Paste 写法
	},
	-- Cmd+C 复制
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.CopyTo("Clipboard"), -- 更标准的 Copy 写法
	},
}

return config
