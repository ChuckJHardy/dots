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
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true

-- Window Padding
config.window_padding = {
	left = 10,
	right = 20,
	top = 10,
	bottom = 0,
}

-- Window Config
config.window_decorations = "RESIZE"

-- Startup Configuration
wezterm.on("gui-startup", function(cmd)
	local home = wezterm.home_dir

	-- Create the first window with the Server tab
	local tab, pane, window = wezterm.mux.spawn_window({
		cwd = home .. "/Projects/habium",
	})

	-- Create additional tabs
	local tabs = {
		{ name = "HC", path = home .. "/Projects/habium" },
		{ name = "App", path = home .. "/Projects/habium/desktop" },
		{ name = "API", path = home .. "/Projects/habium/api" },
		{ name = "Book", path = home .. "/Obsidian/Golf/Impact Inc" },
	}

	-- Set the title of the initial tab
	if tab then
		tab:set_title("Server")
	end

	for _, tab_info in ipairs(tabs) do
		local new_tab = window:spawn_tab({
			cwd = tab_info.path,
		})
		if new_tab then
			new_tab:set_title(tab_info.name)
		end
	end

	-- Switch back to the first tab
	window:gui_window():perform_action(act.ActivateTab(0), pane)
end)

return config
