-- Replace SUPER + 1-9 with ALT + 1-9
for i = 1, 9 do
    hl.unbind("SUPER + " .. i)
    hl.unbind("ALT + " .. i)

    hl.bind(
        "ALT + " .. i,
        hl.dsp.focus({ workspace = tostring(i) })
    )
end

-- Workspace 10: ALT + 0
hl.unbind("SUPER + 0")
hl.unbind("ALT + 0")
hl.bind(
    "ALT + 0",
    hl.dsp.focus({ workspace = "10" })
)

-- Move focused window using ALT + SHIFT + 1-9
for i = 1, 9 do
    o.bind(
        "ALT + SHIFT + " .. i,
        "Move window to workspace " .. i,
        hl.dsp.window.move({ workspace = tostring(i) })
    )
end

-- Move focused window to workspace 10
o.bind(
    "ALT + SHIFT + 0",
    "Move window to workspace 10",
    hl.dsp.window.move({ workspace = "10" })
)

-- Chrome shortcuts
o.bind(
    "ALT + 2",
    "Launch Chrome if not open on workspace 2",
    hl.dsp.exec_cmd("~/.config/hypr/scripts/ws2_open_chrome.sh")
)

o.bind(
    "ALT + 3",
    "Workspace 3 + Chrome Default",
    hl.dsp.exec_cmd("~/.config/hypr/scripts/ws3_open_chrome.sh")
)








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
