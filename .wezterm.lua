-- =============================================================================
-- SETUP
-- =============================================================================
-- Symlink: ln -sf ~/dotfiles/.wezterm.lua ~/.wezterm.lua
--          ln -sf ~/dotfiles/.config/wezterm ~/.config/wezterm
-- =============================================================================

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Load modules from ~/.config/wezterm/
local modal = require('modal')

-- =============================================================================
-- KEY BINDINGS
-- =============================================================================

config.keys = {
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.ClearScrollback 'ScrollbackAndViewport',
  },
}

-- =============================================================================
-- PLUGINS
-- =============================================================================

modal.apply(config)

return config