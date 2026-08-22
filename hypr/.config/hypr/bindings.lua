-- Keep only your personal keybinding overrides here. Add new bindings or
-- unbind defaults before replacing them.

-- See current bindings and descriptions:
--   omarchy menu keybindings --print

-- To disable every Omarchy default binding, set this in
-- ~/.config/hypr/hyprland.lua before require("default.hypr.omarchy"), then add
-- only the bindings you want below:
--   omarchy_default_bindings = false

-- To disable all preinstalled app/webapp bindings, set:
--   omarchy_preinstalled_bindings = false

-- Add a new binding.
-- o.bind("SUPER + SHIFT + R", "SSH", "alacritty -e ssh your-server")

-- Change an existing binding by unbinding it first, then binding the key again.
-- This example changes SUPER+SPACE from the launcher to the Omarchy root menu.
-- hl.unbind("SUPER + SPACE")
-- o.bind("SUPER + SPACE", "Omarchy menu", "omarchy-menu toggle root")

-- Disable a default binding without replacing it.
-- hl.unbind("SUPER + SHIFT + B")

-- Logitech MX Keys examples:
-- o.bind("SUPER + SHIFT + S", nil, "omarchy-capture-screenshot")
-- o.bind("SUPER + H", nil, "voxtype record toggle")
-- o.bind("SUPER + PERIOD", nil, "omarchy-shell shell toggle omarchy.emojis")

-- Focus movement, neovim-style: n=left, e=down, i=up, o=right.
hl.unbind("SUPER + O") -- was: Pop window out (float & pin)
o.bind("SUPER + N", nil, hl.dsp.focus({ direction = "l" }))
o.bind("SUPER + E", nil, hl.dsp.focus({ direction = "d" }))
o.bind("SUPER + I", nil, hl.dsp.focus({ direction = "u" }))
o.bind("SUPER + O", nil, hl.dsp.focus({ direction = "r" }))

-- Omarchy menu off SUPER+SPACE; on SHIFT+M and BACKSPACE instead.
hl.unbind("SUPER + SPACE") -- was: Omarchy menu
hl.unbind("SUPER + SHIFT + M") -- was: Music
o.bind("SUPER + SHIFT + M", "Omarchy menu", "omarchy-menu")
hl.unbind("SUPER + BACKSPACE") -- was: Toggle window transparency
o.bind("SUPER + BACKSPACE", "Omarchy menu", "omarchy-menu")

-- Music moved to S.
hl.unbind("SUPER + SHIFT + S") -- was: Google Maps webapp
o.bind("SUPER + SHIFT + S", "Music", { omarchy = "spotify" })

-- Kill active window on SHIFT+W.
hl.unbind("SUPER + SHIFT + W") -- was: Omawrite
o.bind("SUPER + SHIFT + W", nil, hl.dsp.window.close())
