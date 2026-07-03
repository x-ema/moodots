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

-- Layout Config

hl.config({
  general = {
    layout = "scrolling"
  },
  decoration = {
    active_opacity = 1,
    inactive_opacity = 0.7,
--    fullscreen_opaticy = 1,
    blur = {
      enabled = true,
      new_optimizations = true
    }
--    motion_blur = {
--      enabled = true,
--      samples = 7
--      Motion blur not working for now??? "unknown config key decoration.motion_blur.enabled samples etc"
  },
  input = {
    touchpad = {
      disable_while_typing = false,
      natural_scroll = true, 
      clickfinger_behavior = true
    }
  },
  scrolling = {
    explicit_column_widths = "0.5,1.0"
  }
})

-- Window Rules 

hl.window_rule({
  name = "Blur Enable",
  match = {
    class = ".*"
  },
  no_blur = false
})

hl.window_rule({
  name = "Enable Blur (xwayland)",
  match = {
    class = "^()$",
    title = "^()$"
  },
  no_blur = false
})

hl.window_rule({
  name = "Blender file view resize",
  match = {
    class = "^(blender)$"
  },
  size = { "(monitor_w*0.8)", "(monitor_h*0.7)" },
  move = { "monitor_w*0.1", "monitor_h*0.15" }
})

hl.window_rule({
  name = "Gnome Popup Window Resize",
  match = {
    float = true,
    class = "^org.gnome.*$"
  },
  size = { "(monitor_w*0.8)", "(monitor_h*0.7)" },
  move = { "monitor_w*0.1", "monitor_h*0.15" }
})

-- Unbinds

local unbinds = {
  "CTRL + SUPER + Left",
  "CTRL + SUPER + Right",
  "SUPER + Page_Down",
  "SUPER + Page_Up",
  "SUPER + F",
  "SUPER + ALT + F",
  "SUPER + D",
  "SUPER + ALT + Space",
  "SUPER + A",
  "SUPER + ALT + A",
  "SUPER + SUPER_L",
  "SUPER + SUPER_R",
  "SUPER + W",
  "SUPER + RETURN",
  "SUPER + code:19",
  "SUPER + S",
  "SUPER + H",
  "SUPER + J",
  "SUPER + K",
  "SUPER + L",
  "SUPER + mouse_right",
  "SUPER + mouse_left",
  "SUPER + T",
  "SUPER + C",
  "SUPER + E",
  "SUPER + mouse:274",
  "CTRL + RETURN"

}

for i = 0,9 do 
  table.insert(unbinds, "SUPER + "..i)
  table.insert(unbinds, "SUPER + SHIFT + .."..i)
  table.insert(unbinds, "SUPER + ALT + "..i)
end
for i = 10,19 do 
  table.insert(unbinds, "SUPER + code:"..i)
end

for _,key in pairs(unbinds) do 
  hl.unbind(key)
end

-- Binds

hl.bind("SUPER + T", hl.dsp.exec_cmd(terminal), { description = "Application: Terminal" })
hl.bind("SUPER + F", hl.dsp.exec_cmd(browser), { description = "Application: Web Browser"})
hl.bind("SUPER + C", hl.dsp.exec_cmd(editor), { description = "Application: Text Editor"})
hl.bind("SUPER + E", hl.dsp.exec_cmd(file_browser), { description = "Application: File Browser"})
hl.bind("ALT + RETURN", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Window: Toggle Fullscreen" })

-- Vim like movement for focusing windows + moving
local focusdir = { {"H","l"}, {"J","d"}, {"K","u"}, {"L","r"}, {"1", "l"}, {"2", "r"} }
for _,dir in pairs(focusdir) do 
  hl.bind("SUPER + "..dir[1], hl.dsp.focus({ direction = dir[2] }), { description = "Window: Focus '"..dir[2].."'" })
  hl.bind("SUPER + SHIFT + "..dir[1], hl.dsp.window.move({ direction = dir[2] }), { description = "Window: Move '"..dir[2].."'" })
end

hl.bind("SUPER + mouse_left", hl.dsp.focus({ direction = "l" }), { description = "Layout: Scroll Left" })
hl.bind("SUPER + mouse_right", hl.dsp.focus({ direction = "r" }), { description = "Layout: Scroll Right" })
hl.bind("SUPER + code:274", hl.dsp.layout("colresize +conf"), { description = "Window: Maximize Window" })
hl.bind("CTRL + RETURN", hl.dsp.layout("colresize +conf"), { description = "Window: Maximize Window"})

hl.bind("SUPER + 0", hl.dsp.exec_cmd("fish ~/.config/hypr/custom/scripts/steam-mode-switch.fish"), { description = "Steam: Toggle Big Picture"})
