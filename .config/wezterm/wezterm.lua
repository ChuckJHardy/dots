local wezterm = require("wezterm")
local act = wezterm.action

local config = wezterm.config_builder()

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("JetBrainsMono Nerd Font")

-- Fix MacOS Alt Key
config.send_composed_key_when_left_alt_is_pressed = true
config.send_composed_key_when_right_alt_is_pressed = false

config.keys = {
	{
		key = "n",
		mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _, line)
				if line then
					window:active_tab():set_title(line)
				end
			end),
		}),
	},
}

-- Tab Bar Config
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true
config.show_tab_index_in_tab_bar = true
config.window_frame = {
	active_titlebar_bg = "#222436",
	inactive_titlebar_bg = "#222436",
	font_size = 8.0,
}

-- Window Padding
config.window_padding = {
	left = 10,
	right = 20,
	top = 10,
	bottom = 0,
}

-- Window Config
config.window_decorations = "RESIZE"

return config
