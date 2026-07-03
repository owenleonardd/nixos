-- ~/.config/hypr/hyprland.lua

----------------
-- MONITORS
----------------

hl.monitor({
  output = "eDP-1",
  mode = "2880x1800@120",
  position = "0x1440",
  scale = 2,
})

hl.monitor({
  output = "DP-1",
  mode = "2560x1440@200",
  position = "0x0",
  scale = 1,
})


-------------------
-- MY PROGRAMS
-------------------

local terminal = "foot"
local fileManager = "dolphin"
local menu = "fuzzel"
local browser = "firefox"


---------------
-- AUTOSTART
---------------

hl.on("hyprland.start", function()
  -- hl.exec_cmd(terminal)
  hl.exec_cmd("nm-applet")
  -- hl.exec_cmd("waybar & hyprpaper & firefox")
  hl.exec_cmd("waybar")
end)


---------------------------
-- ENVIRONMENT VARIABLES
---------------------------

hl.env("XCURSOR_SIZE", "32")
hl.env("HYPRCURSOR_SIZE", "32")


----------------
-- PERMISSIONS
----------------

-- Permission changes require a Hyprland restart.
--
-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })
--
-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-------------------
-- LOOK AND FEEL
-------------------

hl.config({
  general = {
    gaps_in = 5,
    gaps_out = 20,

    border_size = 2,

    col = {
      active_border = "rgba(ffffff99)",
      inactive_border = "rgba(ffffff44)",
    },

    resize_on_border = true,
    allow_tearing = false,

    layout = "master",
  },

  decoration = {
    rounding = 10,
    rounding_power = 2,

    active_opacity = 1.0,
    inactive_opacity = 1.0,

    shadow = {
      enabled = false,
      range = 4,
      render_power = 3,
      color = "rgba(1a1a1aee)",
    },

    blur = {
      enabled = false,
      size = 3,
      passes = 1,
      vibrancy = 0.1696,
    },
  },

  animations = {
    enabled = true,
  },

  dwindle = {
    preserve_split = true,
    force_split = 2,
    split_width_multiplier = 0,
  },

  master = {
    new_status = "slave",
    mfact = 0.50,
  },

  misc = {
    force_default_wallpaper = 0,
    disable_hyprland_logo = true,
    background_color = 0x000000,
  },
})


----------------
-- ANIMATIONS
----------------

hl.curve("easeOutQuint", {
  type = "bezier",
  points = { { 0.23, 1 }, { 0.32, 1 } },
})

hl.curve("easeInOutCubic", {
  type = "bezier",
  points = { { 0.65, 0.05 }, { 0.36, 1 } },
})

hl.curve("linear", {
  type = "bezier",
  points = { { 0, 0 }, { 1, 1 } },
})

hl.curve("almostLinear", {
  type = "bezier",
  points = { { 0.5, 0.5 }, { 0.75, 1 } },
})

hl.curve("quick", {
  type = "bezier",
  points = { { 0.15, 0 }, { 0.1, 1 } },
})

hl.animation({ leaf = "global", enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "border", enabled = false, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows", enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn", enabled = true, speed = 4.1, bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut", enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn", enabled = false, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut", enabled = false, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade", enabled = false, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers", enabled = false, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn", enabled = false, speed = 4, bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut", enabled = false, speed = 1.5, bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn", enabled = false, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut", enabled = false, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces", enabled = false, speed = 1.94, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "workspacesIn", enabled = false, speed = 1.21, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "workspacesOut", enabled = false, speed = 1.94, bezier = "almostLinear", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceIn", enabled = true, speed = 3.94, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "specialWorkspaceOut", enabled = true, speed = 3.94, bezier = "easeOutQuint", style = "slidevert" })
hl.animation({ leaf = "zoomFactor", enabled = true, speed = 7, bezier = "quick" })


-------------------
-- WORKSPACE RULES
-------------------

-- Smart gaps / no gaps when only.
--
-- hl.workspace_rule({
--   workspace = "special:spotify",
--   gaps_out = 30,
--   gaps_in = 5,
-- })
--
-- hl.workspace_rule({
--   workspace = "w[tv1]",
--   gaps_out = 0,
--   gaps_in = 0,
-- })
--
-- hl.workspace_rule({
--   workspace = "f[1]",
--   gaps_out = 0,
--   gaps_in = 0,
-- })


----------------
-- WINDOW RULES
----------------

hl.window_rule({
  name = "firefox-workspace-2",
  match = {
    class = "firefox",
  },
  workspace = "2",
})

-- Smart gaps window rules.
--
-- hl.window_rule({
--   name = "no-gaps-wtv1",
--   match = {
--     float = false,
--     workspace = "w[tv1]",
--   },
--   border_size = 0,
--   rounding = 0,
-- })
--
-- hl.window_rule({
--   name = "no-gaps-f1",
--   match = {
--     float = false,
--     workspace = "f[1]",
--   },
--   border_size = 0,
--   rounding = 0,
-- })



-----------
-- INPUT
-----------

hl.config({
  input = {
    kb_layout = "us",
    kb_variant = "",
    kb_model = "",
    kb_options = "",
    kb_rules = "",

    follow_mouse = 1,

    sensitivity = 0.4,

    touchpad = {
      natural_scroll = true,
    },

    accel_profile = "flat",
  },
})


-------------
-- GESTURES
-------------

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
})

hl.gesture({
  fingers = 3,
  direction = "vertical",
  action = "special",
  workspace_name = "spotify",
})


------------
-- DEVICES
------------

hl.device({
  name = "epic-mouse-v1",
  sensitivity = -0.5,
})

hl.device({
  name = "syna2ba6:00-06cb:cfd8-touchpad",
  accel_profile = "custom 0.1378592682 0.000, 0.104, 0.208, 0.313, 0.463, 0.620, 0.777, 0.934, 1.091, 1.247, 1.480, 1.718, 1.956, 2.195, 2.433, 2.671, 2.909, 3.147, 3.386, 3.624, 3.862, 4.100, 4.338, 4.577, 4.815, 5.053, 5.291, 5.529, 5.768, 6.260",
  scroll_factor = 0.5,
})

hl.device({
  name = "at-translated-set-2-keyboard",
  repeat_rate = 35,
  repeat_delay = 200,
})


----------------
-- KEYBINDINGS
----------------

local mainMod = "SUPER"

-- Basic binds.

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
-- hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(browser))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())

hl.bind(
  mainMod .. " + SHIFT + Q",
  hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit")
)

hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle", mode = "fullscreen" }))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())

-- Dwindle.
-- hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))


---------------------------
-- DWINDLE LAYOUT KEYBINDS
---------------------------

-- hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
-- hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))
-- hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
-- hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
-- hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
-- hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

------------------------
-- MASTER LAYOUT BINDS
------------------------

hl.bind(mainMod .. " + j", hl.dsp.layout("cyclenext"))
hl.bind(mainMod .. " + k", hl.dsp.layout("cycleprev"))
hl.bind(mainMod .. " + SHIFT + j", hl.dsp.layout("swapnext"))
hl.bind(mainMod .. " + SHIFT + k", hl.dsp.layout("swapprev"))
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.layout("mfact -0.05"))
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.layout("mfact 0.05"))


----------------
-- WORKSPACES
----------------

for i = 1, 10 do
  local key = tostring(i % 10)

  hl.bind(mainMod .. " + " .. key, hl.dsp.focus({
    workspace = i,
  }))

  hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({
    workspace = i,
  }))
end


-----------------------
-- SPECIAL WORKSPACE
-----------------------

hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("spotify"))

hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({
  workspace = "special:spotify",
}))


----------------------
-- WORKSPACE SCROLL
----------------------

hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({
  workspace = "e+1",
}))

hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({
  workspace = "e-1",
}))


------------------------
-- MOUSE MOVE / RESIZE
------------------------

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
  mouse = true,
})

hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
  mouse = true,
})


-----------------------
-- MULTIMEDIA KEYS
-----------------------

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"), {
  locked = true,
  repeating = true,
})

hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"), {
  locked = true,
  repeating = true,
})

-- Requires playerctl.

hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), {
  locked = true,
})

hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), {
  locked = true,
})

hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), {
  locked = true,
})

hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), {
  locked = true,
})


--------------------------
-- WINDOWS AND WORKSPACES
--------------------------

hl.window_rule({
  name = "suppress-maximize-events",
  match = {
    class = ".*",
  },
  suppress_event = "maximize",
})

hl.window_rule({
  name = "fix-xwayland-drags",
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = true,
    fullscreen = false,
    pin = false,
  },
  no_focus = true,
})

hl.window_rule({
  name = "move-hyprland-run",
  match = {
    class = "hyprland-run",
  },
  move = "20 monitor_h-120",
  float = true,
})

hl.bind("SUPER + M", function()
    local workspace = hl.get_active_workspace()
    if hl.get_active_special_workspace() then
        workspace = hl.get_active_special_workspace()
    end

    if not workspace then
        return
    end

    if workspace.special then
        hl.workspace_rule({ workspace = tostring(workspace.name), layout = "monocle" })
    else
        hl.workspace_rule({ workspace = tostring(workspace.id), layout = "monocle" })
    end
end)

hl.bind("SUPER + T", function()
    local workspace = hl.get_active_workspace()
    if hl.get_active_special_workspace() then
        workspace = hl.get_active_special_workspace()
    end

    if not workspace then
        return
    end

    if workspace.special then
        hl.workspace_rule({ workspace = tostring(workspace.name), layout = "master" })
    else
        hl.workspace_rule({ workspace = tostring(workspace.id), layout = "master" })
    end
end)
