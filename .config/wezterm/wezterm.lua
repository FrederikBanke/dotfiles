local wezterm = require 'wezterm'
local mux = wezterm.mux
local act = wezterm.action

local config = wezterm.config_builder()

-- Apply configurations
config.color_scheme = 'Hardcore'

config.font = wezterm.font 'Hack Nerd Font'
config.font_size = 11

config.window_background_opacity = 0.95
config.hide_tab_bar_if_only_one_tab = true

-- Return configuration to wezterm
return config
