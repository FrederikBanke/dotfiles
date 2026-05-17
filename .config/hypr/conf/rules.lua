------------------------------------
--- WINDOWS AND WORKSPACES RULES ---
------------------------------------
hl.window_rule({ match = { class = ".*" }, suppress_event = "maximize" }) -- You'll probably like this.

-- Steam windows
hl.window_rule({ match = { class = "steam" }, workspace = "name:gaming silent" })
hl.window_rule({ match = { class = "steam", title = "negative:Steam" }, float = true, size = { 600, 650 } })
hl.window_rule({ match = { class = "steam", title = "Friends List" }, float = true, size = { 300, 650 } })

-- TeamSpeak and Discord locked to workspace
hl.window_rule({ match = { class = "discord" }, workspace = "3 silent" })
hl.window_rule({ match = { class = "vesktop" }, workspace = "3 silent" })
hl.window_rule({ match = { class = "TeamSpeak 3" }, workspace = "3 silent" })

-- PiP for browser
hl.window_rule({ match = { title = "Picture-in-Picture" }, float = true })
