-- See https://wiki.hyprland.org/Configuring/Dwindle-Layout/ for more
hl.config({
    dwindle = {
        preserve_split = true -- You probably want this
    },

    master = {
        new_status = "master"
    },

    scrolling = {
        fullscreen_on_one_column = true,
        focus_fit_method = 1, -- 0 = center, 1 = fit
        column_width = 0.5,
        explicit_column_widths = "0.333, 0.5, 0.667, 0.9, 1"
    }
})
