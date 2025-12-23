local wezterm = require('wezterm')
local modal = wezterm.plugin.require('https://github.com/MLFlexer/modal.wezterm')

local M = {}

function M.apply(config)
  -- Apply modal plugin with default keybindings and modes
  modal.apply_to_config(config)
  modal.set_default_keys(config)

  -- Optional: Set up status display on mode changes
  wezterm.on('modal.enter', function(name, window, pane)
    modal.set_right_status(window, name)
  end)

  wezterm.on('modal.exit', function(name, window, pane)
    window:set_right_status('')
  end)
end

return M
