--------------------
---- WINDOW RULES --
--------------------
-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-----------------------
-- GLOBAL FIXES
-----------------------

-- Ignore maximize requests from all apps
local suppressMaximizeRule = hl.window_rule({
    name           = "suppress-maximize-events",
    match          = { class = ".*" },
    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

-- Fix some dragging issues with XWayland
hl.window_rule({
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },
    no_focus = true,
})

-----------------------
-- APP BEHAVIOR
-----------------------

-- Hyprland-run launcher position
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move  = "20 monitor_h-120",
    float = true,
})

-- Satty screenshot editor
hl.window_rule({ match = { class = "com.gabm.satty" }, float = true, center = true })

-- GTK file picker
hl.window_rule({ match = { class = "xdg-desktop-portal-gtk" }, float = true, center = true })

-- Open/Save dialogs
hl.window_rule({
    match = { title = "^(Open File|Save As|Export|Import)$" },
    float  = true,
    center = true,
})

-----------------------
-- DOLPHIN
-----------------------

hl.window_rule({
    match   = { class = "^(org.kde.dolphin)$" },
    float   = true,
    center  = true,
    size    = { 1200, 800 },
    opacity = "0.85 override 0.85 override",
})

-----------------------
-- KEEPASSXC
-----------------------

hl.window_rule({
    match  = { class = "^(org.keepassxc.KeePassXC)$" },
    float  = true,
    center = true,
    size   = { 1000, 700 },
})

-----------------------
-- MEDIA / BROWSERS
-----------------------

-- Dunst notifications
hl.window_rule({
    match   = { class = "Dunst" },
    no_blur = true,
    opacity = "1.0 override",
})

-- Firefox and Stremio (no blur, full opacity)
hl.window_rule({
    match   = { class = "(firefox|com.stremio.stremio)" },
    no_blur = true,
    opacity = "1.0 override",
})

-----------------------
-- SPOTIFY
-----------------------

hl.window_rule({
    name    = "spotify-config",
    match   = { class = "^(Spotify)$" },
    float   = true,
    center  = true,
    opacity = "0.85 0.85",
    --size  = { 1280, 800 },
})
