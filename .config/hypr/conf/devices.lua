-------------
--- INPUT ---
-------------

-- https://wiki.hyprland.org/Configuring/Variables/#input
hl.config({
    input = {
        kb_layout = "dk",

        numlock_by_default = true,

        follow_mouse = 1,

        sensitivity = -0.2,     -- -1.0 - 1.0, 0 means no modification.
        accel_profile = "flat", -- flat removes acceleration

        touchpad = {
            natural_scroll = false
        }
    },

    cursor = {
        no_hardware_cursors = 1
    },
})
