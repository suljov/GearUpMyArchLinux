-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

-- Cursor
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")

-- XDG Specifications
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_SESSION_DESKTOP", "Hyprland")
hl.env("XDG_MENU_PREFIX", "arch-")

-- Themes / Qt
hl.env("QT_AUTO_SCREEN_SCALE_FACTOR", "1")
hl.env("QT_QPA_PLATFORM", "wayland;xcb")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
-- hl.env("QT_QPA_PLATFORMTHEME", "gtk3")
-- hl.env("QT_QPA_PLATFORMTHEME_QT6", "gtk3")

-- Toolkit backends
hl.env("GDK_BACKEND", "wayland,x11,*")
hl.env("CLUTTER_BACKEND", "wayland")

-- SDL (games)
hl.env("SDL_VIDEODRIVER", "wayland")

-- Firefox
hl.env("MOZ_ENABLE_WAYLAND", "1")

-- Electron apps
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")

-- NVIDIA
--hl.env("LIBVA_DRIVER_NAME", "nvidia")
--hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
--hl.env("NVD_BACKEND", "direct")
--hl.env("GBM_BACKEND", "nvidia-drm")
-- Force apps to use Wayland and NVIDIA
--hl.env("GBM_BACKEND", "nvidia-drm")
--hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
