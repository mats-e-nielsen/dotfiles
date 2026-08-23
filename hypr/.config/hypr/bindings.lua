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

-- Zoom in/out on the omarchy zoom level (cursor zoom factor).
-- Note: SUPER+CTRL+MINUS was previously bound to "Expand window left a lot"
-- and SUPER+CTRL+EQUAL to "Shrink window left a lot".
hl.unbind("SUPER + CTRL + MINUS")
hl.unbind("SUPER + CTRL + EQUAL")
o.bind("SUPER + CTRL + MINUS", "Zoom out", function()
  local zoom = hl.get_config("cursor.zoom_factor") or 1
  hl.config({ cursor = { zoom_factor = math.max(1, zoom - 1) } })
end)
o.bind("SUPER + CTRL + EQUAL", "Zoom in", function()
  local zoom = hl.get_config("cursor.zoom_factor") or 1
  hl.config({ cursor = { zoom_factor = zoom + 1 } })
end)

-- Remove monitor scaling shortcuts so they can't be hit accidentally.
hl.unbind("SUPER + SLASH") -- was: Monitor scaling up
hl.unbind("SUPER + ALT + SLASH") -- was: Monitor scaling down

-- Switch to workspaces 1-5 on l/u/y/æ/å.
hl.unbind("SUPER + L") -- was: Toggle workspace layout
o.bind("SUPER + L", "Switch to workspace 1", hl.dsp.focus({ workspace = "1" }))
o.bind("SUPER + U", "Switch to workspace 2", hl.dsp.focus({ workspace = "2" }))
o.bind("SUPER + Y", "Switch to workspace 3", hl.dsp.focus({ workspace = "3" }))
o.bind("SUPER + AE", "Switch to workspace 4", hl.dsp.focus({ workspace = "4" }))
o.bind("SUPER + ARING", "Switch to workspace 5", hl.dsp.focus({ workspace = "5" }))

-- Move focused window to workspaces 1-5 on shift+l/u/y/æ/å.
hl.unbind("SUPER + SHIFT + Y") -- was: YouTube
o.bind("SUPER + SHIFT + L", "Move window to workspace 1", hl.dsp.window.move({ workspace = "1" }))
o.bind("SUPER + SHIFT + U", "Move window to workspace 2", hl.dsp.window.move({ workspace = "2" }))
o.bind("SUPER + SHIFT + Y", "Move window to workspace 3", hl.dsp.window.move({ workspace = "3" }))
o.bind("SUPER + SHIFT + AE", "Move window to workspace 4", hl.dsp.window.move({ workspace = "4" }))
o.bind("SUPER + SHIFT + ARING", "Move window to workspace 5", hl.dsp.window.move({ workspace = "5" }))
