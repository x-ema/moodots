# Startup & Shutdown
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprland-session.target")
end)


hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
    -- uses a blocking exec function and sleeps a bit to give things time to close
    -- you might also want to kill troublesome/crashing non-systemd background services here:
    -- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")
end)

# Monitors

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1
})

# Binds

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "r-1" }), { description = "Workspace: Focus Left" })
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "r+1" }), { description = "Workspace: Focus Right" })
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"), { description = "Application: Terminal" })
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Window: Close" })
