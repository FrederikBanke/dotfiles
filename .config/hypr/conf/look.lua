---------------------
--- LOOK AND FEEL ---
---------------------

-- Refer to https://wiki.hyprland.org/Configuring/Variables/

require("conf.colors")
-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({

    general = {
        gaps_in = 2,
        gaps_out = 5,

        border_size = 1,

        col = {
            active_border = muted,
            -- col.active_border = $color11 $background $background $color14 45deg
            inactive_border = base,
        },

        -- Set to true enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,
        allow_tearing = false,
        layout = "scrolling"
    },

    decoration = {
        rounding = 0,

        -- Change transparency of focused and unfocused windows
        active_opacity = 1.0,
        inactive_opacity = 0.9,
        fullscreen_opacity = 1.0,

        shadow = {
            enabled = false,
            range = 2,
            render_power = 3,
            color = "rgba(1a1a1aee)",
        },

        blur = {
            enabled = false,
            size = 3,
            passes = 1,

            vibrancy = 0.1696,
        }
    },

    animations = {
        enabled = true,
    },

    misc = {
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true -- If true disables the random hyprland logo / anime girl background. :(
    }
})

hl.curve("myBezier", { type = "bezier", points = { { 0.05, 0.9 }, { 0.1, 1.05 } } })

hl.animation({
    leaf = "windows",
    enabled = 1,
    speed = 1,
    bezier = "myBezier",
})

hl.animation({
    leaf = "windowsOut",
    enabled = 1,
    speed = 7,
    bezier = "default",
    style = "popin 80%",
})

hl.animation({
    leaf = "border",
    enabled = 1,
    speed = 10,
    bezier = "default",
})

hl.animation({
    leaf = "borderangle",
    enabled = 1,
    speed = 8,
    bezier = "default",
})

hl.animation({
    leaf = "fade",
    enabled = 1,
    speed = 7,
    bezier = "default",
})

hl.animation({
    leaf = "workspaces",
    enabled = 0,
})
