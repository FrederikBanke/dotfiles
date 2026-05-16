-----------------
--- AUTOSTART ---
-----------------

hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start plasma-polkit-agent") -- Auth agent daemon
    hl.exec_cmd("qs -c noctalia-shell")
    hl.dsp.focus({ workspace = 1 })                           -- Make sure we focus main monitor on startup
    -- hl.exec_cmd(dunst # Notifcation daemon
    hl.exec_cmd("hypridle")
    hl.exec_cmd("nm-applet")
    -- hl.exec_cmd("sunshine")
    hl.exec_cmd("solaar --window=hide")
end)
