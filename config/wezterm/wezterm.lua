-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

config.color_scheme = "Tokyo Night Moon"
config.font = wezterm.font("JetBrains Mono")

-- and finally, return the configuration to wezterm
return config