-----------------------------
--- ENVIRONMENT VARIABLES ---
-----------------------------

-- See https://wiki.hyprland.org/Configuring/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_SESSION_TYPE", "wayland")

-------------------
--- MY PROGRAMS ---
-------------------

terminal = "ghostty"
fileManager = "thunar"
menu = "wofi -S drun"
browser = "zen-browser"
steam = "~/.millennium/start.sh"      -- Steam with Millennium
ipc = "qs -c noctalia-shell ipc call" -- qs ipc for keybinds
