-- Vars

local terminal = "kitty"
local browser = "firefox"
local editor = "kitty -e nvim"
local file_browser = "kitty -e yazi"

-- Startup & Shutdown
hl.on("hyprland.start", function()
    hl.exec_cmd("systemctl --user start hyprland-session.target")
end)


hl.on("hyprland.shutdown", function()
    os.execute("systemctl --user stop hyprland-session.target && sleep 0.1")
    -- uses a blocking exec function and sleeps a bit to give things time to close
    -- you might also want to kill troublesome/crashing non-systemd background services here:
    -- os.execute("pkill wallpaperthing; systemctl --user stop hyprland-session.target && sleep 0.1")
end)

-- Monitors

hl.monitor({
  output = "",
  mode = "preferred",
  position = "auto",
  scale = 1
})

-- Layout Config

hl.config({
  general = {
    layout = "scrolling"
  },
  decoration = {
    rounding = 20,
    active_opacity = 1,
    inactive_opacity = 0.5,
--    fullscreen_opaticy = 1,
    blur = {
      enabled = true,
      new_optimizations = true
    }
--    motion_blur = {
--      enabled = true,
--      samples = 7
--      Motion blur not working for now??? "unknown config key decoration.motion_blur.enabled samples etc"
    }
  },
  input = {
    touchpad = {
      disable_while_typing = false,
      natural_scroll = true, 
      clickfinger_behavior = true
    }
  }
})

-- Binds

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "r-1" }), { description = "Workspace: Focus Left" })
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "r+1" }), { description = "Workspace: Focus Right" })
hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = "r-1", follow = true }, { description = "Window: Move to previous workspace" }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = "r+1", follow = true }, { description = "Window: Move to next workspace" }))
hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal), { description = "Application: Terminal" })
hl.bind("SUPER + Q", hl.dsp.window.close(), { description = "Window: Close" })
--Launcher/rofi replacement bind
--hl.bind("SUPER + A", )
hl.bind("SUPER + F", hl.dsp.exec_cmd(browser), { description = "Application: Web Browser"})
hl.bind("SUPER + C", hl.dsp.exec_cmd(editor), { description = "Application: Text Editor"})
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_browser), { description = "Application: File Browser"})
hl.bind("ALT + RETURN", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Window: Toggle Fullscreen" })

hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), {mouse = true, description = "Window: Move"})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), {mouse = true, description = "Window: Resize" })

-- Vim like movement for focusing windows + moving
local focusdir = { {"H","l"}, {"J","d"}, {"K","u"}, {"L","r"} }
for _,dir in pairs(focusdir) do 
  hl.bind("SUPER + "..dir[1], hl.dsp.focus({ direction = dir[2] }), { description = "Window: Focus '"..dir[2].."'" })
  hl.bind("SUPER + SHIFT + "..dir[1], hl.dsp.window.move({ direction = dir[2] }), { description = "Window: Move '"..dir[2].."'" })
end

hl.bind("SUPER + mouse_left", hl.dsp.layout("move +100"), { description = "Layout: Scroll Left" })
hl.bind("SUPER + mouse_right", hl.dsp.layout("move -100"), { description = "Layout: Scroll Right" })
