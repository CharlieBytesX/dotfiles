-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = require("wezterm").action
local mode_file = "dark_or_light_mode.txt"
-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- config.font = wezterm.font("JetbrainsMono Nerd Font")
config.font = wezterm.font("Comic Code Ligatures")
-- For example, changing the color scheme:

---cycle through builtin dark schemes in dark mode,
---and through light schemes in light mode
-- global variables
-- light_scheme = "Material"
light_scheme = "seoulbones_light"
-- dark_scheme = "catppuccin-mocha"
dark_scheme = "rose-pine-dawn"
default_color_scheme = dark_scheme

config.color_scheme = "rose-pine-dawn"
config.enable_tab_bar = true
-- config.default_cursor_style = "BlinkingBar"

config.window_decorations = "RESIZE"

-- Function to read the current mode from the file
local function read_mode_from_file()
	local f = io.open(mode_file, "r")
	if f then
		local mode = f:read("*l")
		f:close()
		return mode
	end
	return nil
end

-- Function to save the current mode to the file
local function save_mode_to_file(mode)
	local f = io.open(mode_file, "w")
	if f then
		f:write(mode .. "\n")
		f:close()
	end
end

local saved_mode = read_mode_from_file()
if saved_mode == "dark" then
	config.color_scheme = dark_scheme
else
	config.color_scheme = light_scheme
end

wezterm.on("toggle-dark-mode", function(window, _)
	local overrides = window:get_config_overrides() or {}
	if overrides.color_scheme == light_scheme then
		overrides.color_scheme = dark_scheme
		save_mode_to_file("dark")
	else
		overrides.color_scheme = light_scheme
		save_mode_to_file("light")
	end
	window:set_config_overrides(overrides)
end)

config.keys = {
	{
		key = "t",
		mods = "ALT",
		action = act({ EmitEvent = "toggle-dark-mode" }),
	},
	{
		key = "h",
		mods = "ALT",
		action = act.ActivateTabRelative(-1),
	},
	{
		key = "l",
		mods = "ALT",
		action = act.ActivateTabRelative(1),
	},
	{
		key = "o",
		mods = "CTRL|SHIFT",
		action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "e",
		mods = "CTRL|SHIFT",
		action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		key = "h",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Left"),
	},
	{
		key = "l",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Right"),
	},
	{
		key = "j",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Down"),
	},
	{
		key = "k",
		mods = "CTRL|SHIFT",
		action = act.ActivatePaneDirection("Up"),
	},
}

-- and finally, return the configuration to wezterm
return config
