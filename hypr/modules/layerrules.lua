--------------------
---- LAYER RULES ---
--------------------
-- See https://wiki.hypr.land/Configuring/Basics/Layer-Rules/

-----------------------
-- WAYBAR EFFECTS
-----------------------

hl.layer_rule({
    match        = { namespace = "waybar" },
    blur         = true,
    ignore_alpha = 0.3,
})

-----------------------
-- NOCTALIA EFFECTS
-----------------------

hl.layer_rule({
    name         = "noctalia",
    match        = { namespace = "noctalia-background-.*$" },
    blur         = true,
    blur_popups  = true,
    ignore_alpha = 0.5,
})