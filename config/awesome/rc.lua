-- --- imports ---
pcall(require, "luarocks.loader")

local gears = require("gears")
local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")

require("awful.autofocus")
local hotkeys_popup = require("awful.hotkeys_popup")
require("awful.hotkeys_popup.keys")

-- --- error handling ---
if awesome.startup_errors then
    naughty.notify({
        preset = naughty.config.presets.critical,
        title = "Oops, there were errors during startup!",
        text = awesome.startup_errors
    })
end

do
    local in_error = false
    awesome.connect_signal("debug::error", function (err)
        if in_error then return end

        in_error = true
        naughty.notify({
            preset = naughty.config.presets.critical,
            title = "Oops, an error happened!",
            text = tostring(err)
        })
        in_error = false
    end)
end

-- --- variables ---
local term = "xterm"
local lightTerm = "xterm"
local fileMgr = "pcmanfm"
local menu = "rofi -show drun -theme ~/.local/share/themes/my-theme/rofi/theme.rasi -show-icons"

editor = os.getenv("EDITOR") or "vi"
editor_cmd = term .. " -e " .. editor

mod = "Mod4"

awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.spiral.dwindle,
    awful.layout.suit.tile,
    awful.layout.suit.max
}

-- --- init ---
beautiful.init("~/.config/awesome/themes/my-theme/theme.lua")

-- --- autostart ---
awful.spawn.once("picom")
awful.spawn.with_shell("~/bin/set-wallpaper.sh")
awful.spawn.once("nm-applet")

-- --- menu ---
menu_main = awful.menu({
    items = {
        { "Terminal", term, "terminal" },
        { "Terminal (light)", lightTerm },
        { "File Manager", fileMgr },
        { "App Menu", menu },
        { "Firefox", "firefox" },
        {
            "Awesome", 
            {
                { "Restart", awesome.restart },
                { "Exit", function() awesome.quit() end },
            }
        }
    }
})

launcher_main = awful.widget.launcher({
    image = beautiful.awesome_icon,
    menu = menu_main
})

menubar.utils.term = term

-- --- bar ---
global_text_clock = wibox.widget.textclock("%d-%m-%Y %H:%M")

local buttons_tag_list = gears.table.join(
    awful.button(
        { }, 1,
        function(t) t:view_only() end
    ),
    awful.button(
        { mod }, 1, 
        function(t)
            if client.focus then
                client.focus:move_to_tag(t)
            end
        end
    )
)

local buttons_wnd_list = gears.table.join(
    awful.button(
        { }, 1,
        function (c)
            if c == client.focus then
                c.minimized = true
            else
                c:emit_signal(
                    "request::activate",
                    "tasklist",
                    {raise = true}
                )
            end
        end
    )
)

awful.screen.connect_for_each_screen(function(s)
    -- tags
    awful.tag({ "1", "2", "3", "4", "5", "6", "7", "8", "9" }, s, awful.layout.layouts[1])
    
    -- various widgets
    s.my_prompt_box = awful.widget.prompt()

    s.my_tags_list = awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        buttons = buttons_tag_list
    }

    s.my_wnd_list = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = buttons_wnd_list
    }
    
    s.my_layout_box = awful.widget.layoutbox(s)
    s.my_layout_box:buttons(
        gears.table.join(
            awful.button({ }, 1, function () awful.layout.inc( 1) end),
            awful.button({ }, 3, function () awful.layout.inc(-1) end)
        )
    )

    -- the actual bar
    s.my_bar = awful.wibar({
        position = "bottom",
        screen = s
    })

    s.my_bar:setup {
        layout = wibox.layout.align.horizontal,
        {
            layout = wibox.layout.fixed.horizontal,
            launcher_main,
            s.my_tags_list,
            s.my_prompt_box
        },
        s.my_wnd_list,
        {
            layout = wibox.layout.fixed.horizontal,
            wibox.widget.systray(),
            global_text_clock,
            s.my_layout_box
        }
    }
end)

-- --- mouse bindings ---
root.buttons(gears.table.join(  -- TODO: don't seem to work?
    awful.button({ }, 3, function () menu_main:toggle() end),
    awful.button({ }, 4, awful.tag.viewnext),
    awful.button({ }, 5, awful.tag.viewprev)
))

-- --- key bindings ---
key_bindings_global = gears.table.join(
    -- ---
    awful.key(
        { mod }, "q",
        function () awful.spawn(term) end
    ),
    awful.key(
        { mod, "Shift" }, "q",
        function () awful.spawn(lightTerm) end
    ),
    awful.key(
        { mod }, "e",
        function () awful.spawn(fileMgr) end
    ),
    awful.key(
        { mod }, "d",
        function () awful.spawn(menu) end
    ),

    -- ---
    awful.key(
        { mod }, "h",
        function () awful.client.focus.bydirection("left") end
    ),
    awful.key(
        { mod }, "j",
        function () awful.client.focus.bydirection("down") end
    ),
    awful.key(
        { mod }, "k",
        function () awful.client.focus.bydirection("up") end
    ),
    awful.key(
        { mod }, "l",
        function () awful.client.focus.bydirection("right") end
    ),
    
    awful.key(
        { mod }, "Tab",
        function () 
            awful.client.focus.byidx(1)
            if client.focus then client.focus:raise() end
        end
    ),
    awful.key(
        { mod, "Shift" }, "Tab",
        function () awful.client.focus.byidx(-1) end
    ),
    
    awful.key(
        { mod, "Shift" }, "h",
        function () awful.client.swap.bydirection("left") end
    ),
    awful.key(
        { mod, "Shift" }, "j",
        function () awful.client.swap.bydirection("down") end
    ),
    awful.key(
        { mod, "Shift" }, "k",
        function () awful.client.swap.bydirection("up") end
    ),
    awful.key(
        { mod, "Shift" }, "l",
        function () awful.client.swap.bydirection("right") end
    ),

    -- ---
    awful.key(
        { mod }, "space",
        function () awful.layout.inc(1) end
    ),
    awful.key(
        { mod }, "r",
        function () awful.screen.focused().my_prompt_box:run() end
    ),
    
    awful.key(
        { mod, "Ctrl" }, "l",
        function () awful.spawn.with_shell("~/bin/lock.sh") end
    ),
    awful.key(
        { mod, "Shift" }, "r",
        awesome.restart
    ),
    awful.key(
        { mod }, "Escape",
        function () awful.spawn.with_shell("~/bin/power-menu.sh") end
    ),
    awful.key(
        { mod }, "m",
        awesome.quit
    ),

    -- ---
    awful.key({}, "XF86AudioRaiseVolume", function() awful.spawn.with_shell("~/bin/vol-ctl.sh up") end),
    awful.key({}, "XF86AudioLowerVolume", function() awful.spawn.with_shell("~/bin/vol-ctl.sh down") end),
    awful.key({}, "XF86AudioMute",        function() awful.spawn.with_shell("~/bin/vol-ctl.sh mute") end),

    awful.key({}, "XF86MonBrightnessUp",   function() awful.spawn.with_shell("~/bin/brightness-ctl.sh up") end),
    awful.key({}, "XF86MonBrightnessDown", function() awful.spawn.with_shell("~/bin/brightness-ctl.sh down") end)
)

key_bindings_client = gears.table.join(
    awful.key(
        { mod }, "c",
        function (c) c:kill() end
    ),
    awful.key(
        { mod }, "v",
        awful.client.floating.toggle
    ),
    awful.key({ mod }, "f",
        function (c)
            c.fullscreen = not c.fullscreen
            c:raise()
        end
    ),
    awful.key({ mod }, "Down",
        function (c)
            if c.maximized then
                c.maximized = false
            else
                c.minimized = true
            end
        end
    ),
    awful.key({ mod }, "Up",
        function (c)
            c.maximized = not c.maximized
            c:raise()
        end
    ),
    awful.key({ mod }, "Left",
        function (c)
            local cur_layout = awful.layout.get(c.screen)
            if cur_layout == awful.layout.suit.floating or c.floating then
                c.maximized = false

                local wa = c.screen.workarea
                c:geometry({
                    x = wa.x,
                    y = wa.y,
                    width = math.floor(wa.width / 2),
                    height = wa.height
                })
            end
        end
    ),
    awful.key({ mod }, "Right",
        function (c)
            local cur_layout = awful.layout.get(c.screen)
            if cur_layout == awful.layout.suit.floating or c.floating then
                c.maximized = false

                local wa = c.screen.workarea
                c:geometry({
                    x = wa.x + math.floor(wa.width / 2),
                    y = wa.y,
                    width = math.floor(wa.width / 2),
                    height = wa.height
                })
            end
        end
    )
)

for i = 1, 9 do
    key_bindings_global = gears.table.join(key_bindings_global,
        awful.key(
            { mod }, "#" .. i + 9,
            function ()
                local screen = awful.screen.focused()
                local tag = screen.tags[i]
                if tag then
                    tag:view_only()
                end
            end
        ),
        awful.key(
            { mod, "Shift" }, "#" .. i + 9,
            function ()
                if client.focus then
                    local tag = client.focus.screen.tags[i]
                    if tag then
                        client.focus:move_to_tag(tag)
                    end
                end
            end
        )
    )
end

buttons_client = gears.table.join(
    awful.button(
        { }, 1,
        function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
        end
    ),
    awful.button(
        { mod }, 1,
        function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.move(c)
        end
    ),
    awful.button(
        { mod }, 3,
        function (c)
            c:emit_signal("request::activate", "mouse_click", {raise = true})
            awful.mouse.client.resize(c)
        end
    )
)

root.keys(key_bindings_global)

-- --- window rules ---
awful.rules.rules = {
    -- general
    {
        rule = { },
        properties = {
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = key_bindings_client,
            buttons = buttons_client,
            screen = awful.screen.preferred,
            placement = awful.placement.no_overlap+awful.placement.no_offscreen
        }
    },

    -- specifically make these floating
    {
        rule_any = {
            instance = {
                "DTA",
                "copyq",
                "pinentry",
            },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "MessageWin",
                "Sxiv",
                "Tor Browser",
                "Wpa_gui",
                "veromix",
                "xtightvncviewer"
            },
            name = {
                "Event Tester"
            },
            role = {
                "AlarmWindow",
                "ConfigManager",
                "pop-up",
                "dialog"
            }
        },
        properties = {
            floating = true
        }
    },

    -- add titlebars to normal clients and dialogs | TODO: why don't we just do it in the 'general' rule?
    {
        rule_any = {
            type = { "normal", "dialog" }
        },
        properties = { titlebars_enabled = true }
    },

}

-- --- signals ---
client.connect_signal("manage", function (c)
    if awesome.startup
      and not c.size_hints.user_position
      and not c.size_hints.program_position then
        awful.placement.no_offscreen(c)
    end
end)

client.connect_signal("request::titlebars", function(c)
    local buttons_titlebar = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.move(c)
        end),
        awful.button({ }, 3, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )

    awful.titlebar(c) : setup {
        {
            awful.titlebar.widget.iconwidget(c),
            buttons = buttons_titlebar,
            layout  = wibox.layout.fixed.horizontal
        },
        {
            {
                align  = "left",
                widget = awful.titlebar.widget.titlewidget(c)
            },
            buttons = buttons_titlebar,
            layout  = wibox.layout.flex.horizontal
        },
        {
            awful.titlebar.widget.floatingbutton (c),
            awful.titlebar.widget.minimizebutton(c),
            awful.titlebar.widget.maximizedbutton(c),
            awful.titlebar.widget.closebutton    (c),
            layout = wibox.layout.fixed.horizontal()
        },
        layout = wibox.layout.align.horizontal
    }
end)

client.connect_signal("mouse::enter", function(c)
    c:emit_signal("request::activate", "mouse_enter", {raise = false})
end)

client.connect_signal("focus", function(c) c.border_color = beautiful.border_focus end)
client.connect_signal("unfocus", function(c) c.border_color = beautiful.border_normal end)
