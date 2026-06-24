---------------------
---- KEYBINDINGS ----
---------------------
-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more

local mainMod  = "SUPER"
local shiftMod = "SHIFT"
local terminal   = "kitty"
local fileManager = "dolphin"
local menu     = "dms ipc call spotlight toggle"
local ipc      = "qs -c noctalia-shell ipc call"
local altMod = "ALT"

-- Lock screen
hl.bind(mainMod .. " + L",      hl.dsp.exec_cmd("qs -c noctalia-shell ipc call lockScreen lock"))
--hl.bind(mainMod .. " + L",      hl.dsp.exec_cmd("hyprlock"))

-- Core
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + Q",      hl.dsp.window.close())
--hl.bind(mainMod .. " + M", hl.dsp.exit())
--hl.bind(mainMod .. " + M",      hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"))
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J",      hl.dsp.layout("togglesplit"))   -- dwindle only
hl.bind(mainMod .. " + space",  hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space",  hl.dsp.window.center())

-- Fullscreen / Maximize
hl.bind(mainMod .. " + F",       hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))

-- Window management
hl.bind(mainMod .. " + C",       hl.dsp.window.center())
hl.bind(mainMod .. " + Z",       hl.dsp.window.pin())

-- Noctalia shell
hl.bind(mainMod .. " + D",       hl.dsp.exec_cmd(ipc .. " launcher toggle"))
hl.bind(mainMod .. " + R",       hl.dsp.exec_cmd(ipc .. " controlCenter toggle"))
hl.bind(mainMod .. " + comma",   hl.dsp.exec_cmd(ipc .. " settings toggle"))
hl.bind(mainMod .. " + W",       hl.dsp.exec_cmd("qs -c noctalia-shell ipc call plugin:wallcards toggle"))

-- DMS shell
--hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("dms ipc call spotlight toggle"))
--hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("dms ipc wallpaperCarousel toggle"))
--hl.bind(mainMod .. " + comma", hl.dsp.exec_cmd("dms ipc call settings toggle"))

-- Screenshots (Hyprshot)
hl.bind(altMod .. " + S",      hl.dsp.exec_cmd("hyprshot -m window"))
hl.bind(altMod .. " + A",      hl.dsp.exec_cmd("hyprshot -m output"))
hl.bind(altMod .. " + W",      hl.dsp.exec_cmd("hyprshot -z -m region --raw | satty --filename -"))
--hl.bind(shiftMod .. " + W",      hl.dsp.exec_cmd("hyprshot -m window"))
--hl.bind(shiftMod .. " + F",      hl.dsp.exec_cmd("hyprshot -m output"))
--hl.bind(shiftMod .. " + S",      hl.dsp.exec_cmd("hyprshot -z -m region --raw | satty --filename -"))

-- Emoji picker
hl.bind(mainMod .. " + period",  hl.dsp.exec_cmd("rofimoji --action clipboard"))

-- Theme switcher
-- hl.bind(shiftMod .. " + T",   hl.dsp.exec_cmd("~/.config/colorschemes/theme-switcher.sh"))

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",    hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right",   hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",      hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",    hl.dsp.focus({ direction = "down" }))

-- Cycle workspaces with brackets
hl.bind(mainMod .. " + bracketright", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + bracketleft",  hl.dsp.focus({ workspace = "e-1" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
end

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Resize submap
hl.bind(mainMod .. " + T", hl.dsp.submap("resize"))
hl.define_submap("resize", function()
    hl.bind("right",  function() hl.window.resize({ x =  10, y = 0,   relative = true }) end)
    hl.bind("left",   function() hl.window.resize({ x = -10, y = 0,   relative = true }) end)
    hl.bind("up",     function() hl.window.resize({ x = 0,   y = -10, relative = true }) end)
    hl.bind("down",   function() hl.window.resize({ x = 0,   y =  10, relative = true }) end)
    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Multimedia keys
hl.bind("XF86AudioRaiseVolume",  hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume",  hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",      hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Media controls (requires playerctl)
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),        { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"),  { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),    { locked = true })
