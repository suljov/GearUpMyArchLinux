-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function()
    -- exec-once = qs -c noctalia-shell
    hl.exec_cmd("qs -c noctalia-shell")
    
--    dms
--    hl.exec_cmd("dms run")
    -- exec-once = /usr/lib/polkit-kde-authentication-agent-1
    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")

    -- exec-once = hyprpolkitagent
    hl.exec_cmd("hyprpolkitagent")

    -- exec-once = hypridle
    hl.exec_cmd("hypridle")

    -- exec-once = sleep 5 && openrgb --profile flame --startminimized
    hl.timer(function()
        hl.exec_cmd("openrgb --profile flame --startminimized")
    end, { timeout = 5000, type = "oneshot" })

    -- EasyEffects sound effects
    --hl.exec_cmd("easyeffects --gapplication-service")

-- EasyEffects sound effects (with a 2-second safety delay)
    hl.timer(function()
        hl.exec_cmd("easyeffects --gapplication-service")
    end, { timeout = 2000, type = "oneshot" })

    -- exec-once = hyprctl setcursor macOS 24
    hl.exec_cmd("hyprctl setcursor macOS 24")
end)
