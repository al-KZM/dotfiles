# Copyright (c) 2010 Aldo Cortesi
# Copyright (c) 2010, 2014 dequis
# Copyright (c) 2012 Randall Ma
# Copyright (c) 2012-2014 Tycho Andersen
# Copyright (c) 2012 Craig Barnes
# Copyright (c) 2013 horsik
# Copyright (c) 2013 Tao Sauvage
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

from typing import List  # noqa: F401
from libqtile.log_utils import logger
from libqtile import bar, layout, widget, extension, hook
from libqtile.config import Click, Drag, Group, Key, Match, Screen, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal
import os
import subprocess

HOME = "/home/x41"
BROWSER = "firefox"
LOCK = "/usr/local/bin/slock"
SCREENSHOT = "gscreenshot -c -s -f /tmp"
FILE_EXPLORER = "nautilus"
PYTHON = "/bin/ptpython"

mod = "mod4"
terminal = guess_terminal()

colors =  [
        ["#00000000", "#00000000", "#00000000"],     # color 0
        ["#2e3440", "#2e3440", "#2e3440"], # color 1
        ["#B591B0", "#B591B0", "#B591B0"], # color 2
        ["#A480B2", "#A480B2", "#A480B2"], # color 3
        ["#aed1dc", "#98B7C0", "#aed1dc"], # color 4
        ["#f3f4f5", "#f3f4f5", "#f3f4f5"], # color 5
        ["#bb94cc", "#AB87BB", "#bb94cc"], # color 3
        ["#81658C", "#81658C", "#81658C"], # color 6
        ["#614C69", "#614C69", "#614C69"], # color 8
        ["#0ee9af", "#0ee9af", "#0ee9af"], # color 9
        ["#ff0000", "#ff0000", "#ff0000"], # color 10
        ["#000000", "#000000", "#000000"], # color 10
]

keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),
    Key([mod, "shift"], "Left", lazy.layout.swap_left(),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "Return", lazy.layout.toggle_split()),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "grave", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "Tab", lazy.window.toggle_fullscreen(), desc="Toggle Full screen"),
    Key([mod, "shift"], "grave", lazy.window.toggle_floating(), desc="Toggle Full screen"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "control"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "p", lazy.spawn("dmenu_run -i -nb '#282a36' -nf '#f8f8f2' -l 15"), desc="Dmenu"),
    Key([mod], "w", lazy.spawn(BROWSER), desc="Spawn browser"),
    Key([mod], "e", lazy.spawn(FILE_EXPLORER), desc="Spawn file explorer"),
    Key([mod], "x", lazy.spawn(LOCK), desc="Lock session"),
    Key([mod], "r", lazy.spawn(SCREENSHOT), desc="Take a screenshot"),
    Key([mod], "c", lazy.spawn(f"{terminal} -e {PYTHON}"), desc="Open python console"),

    KeyChord([mod], "m",[
        Key([], "1", lazy.spawn("redshift -O 6000")),
        Key([], "2", lazy.spawn("redshift -O 5000")),
        Key([], "3", lazy.spawn("redshift -O 4500")),
        Key([], "4", lazy.spawn("redshift -O 4250")),
        Key([], "5", lazy.spawn("redshift -O 4000")),
        Key([], "6", lazy.spawn("redshift -O 3500")),
        Key([], "x", lazy.spawn("redshift -x")),
            ]),

]

groups = [
    Group(
        "1"
    ),
    Group(
        "2"
    ),
    Group(
        "3"
    ),
    Group(
        "4"
    ),
    Group(
        "5"
    ),
    Group(
        "6"
    ),
    Group(
        "7"
    ),
    Group(
        "8"
    ),
    Group(
        "9",
        matches=[
            Match(wm_class=["Slack"]),
            Match(wm_class=["zoom"]),
            Match(wm_class=["pavucontrol"]),
        ],
    ),
    Group(
        "0",
        label="X"
    ),
]

class ScreenSwitcher:
    pass

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=False),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_opts = {
    "border_focus_stack":"#97CBEB",
    "border_width":5,
    "border_focus": "#97CBEB",
}

layouts = [
    layout.Columns(border_focus_stack="#97CBEB", border_focus="#97CBEB", border_width=5),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(border_focus="#46c000", border_width=5),
    # layout.MonadWide(**layout_opts),
    # layout.RatioTile(**layout_opts),
    layout.Tile(border_focus="#27eebb", border_width=5),
    layout.TreeTab(border_focus="#97CBEB", border_width=5),
    #layout.VerticalTile(),
    #layout.Zoomy(),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

def get_wallpaper() -> str:
    return "~/.config/wallpaper/wallpaper.jpg"

def get_vpn() -> str:
    cmd = "curl ifconfig.co"
    #cmd = f"{HOME}/.config/scripts/check_running_openvpn.sh"
    p = subprocess.run(
        ["sh", cmd],
        capture_output=True
    )
    return p.stdout.decode('utf-8')

screens_nb = subprocess.check_output(["xrandr", "--listmonitors"]).decode('utf-8').count('\n') - 1
screens = [
    Screen(
        #bottom=bar.Bar(
        #    [
        #        widget.GroupBox(),
        #        widget.Prompt(),
        #        widget.WindowName(),
        #        widget.Chord(
        #            chords_colors={
        #                'launch': ("#ff0000", "#ffffff"),
        #            },
        #            name_transform=lambda name: name.upper(),
        #        ),
        #        #widgets.VpnChecker(),
        #        widget.GenPollText(
        #            func=get_vpn,
        #            update_interval=1,
        #        ),
        #        widget.Systray(),
        #        widget.Clock(format='%Y-%m-%d %a %I:%M %p'),
        #        widget.Backlight(backlight_name="intel_backlight", set=2),
        #        widget.BatteryIcon(),
        #        widget.Battery(format="{char} {percent:2.0%} ({hour:d}:{min:02d})"),
        #        widget.QuickExit(),
        #    ],
        #    30,
        #),

        top=bar.Bar(
                [
                    widget.TextBox(
                        text="\ue0b6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[8],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.TextBox(
                        text="",
                        fonts="novamono for powerline bold",
                        foreground=colors[5],
                        background=colors[8],
                        padding=0,
                        fontsize=28
                    ),
                    widget.Sep(
                        background=colors[8],
                        padding=8,
                        linewidth=0,
                    ),
                    widget.Clock(
                        font="novamono for powerline bold",
                        fontsize=16,
                        foreground=colors[5],
                        background=colors[8],
                        format='%d %b, %A'
                    ),
                    widget.TextBox(
                        text="\ue0b4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[8],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.Sep(
                        background=colors[0],
                        padding=10,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\ue0b6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[7],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.TextBox(
                        text="",
                        foreground=colors[5],
                        background=colors[7],
                        padding=0,
                        fontsize=33
                    ),
                    widget.Memory(
                        background=colors[7],
                        foreground=colors[5],
                        font="novamono for powerline bold",
                        fontsize=16,
                        measure_mem='G',
                        measure_swap='G',
                        format='{MemUsed: .2f} GB',
                    ),
                    widget.TextBox(
                        text="\ue0b4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[7],
                        padding=0,
                        fontsize=38
                    ),
                    widget.Sep(
                        background=colors[0],
                        padding=10,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\ue0b6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[3],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.TextBox(
                        text="",
                        foreground=colors[5],
                        background=colors[3],
                        padding=0,
                        fontsize=33
                    ),
                    widget.Memory(
                        background=colors[3],
                        foreground=colors[5],
                        font="novamono for powerline bold",
                        fontsize=16,
                        measure_mem='G',
                        measure_swap='G',
                        format='{SwapUsed: .2f} GB',
                    ),
                    widget.TextBox(
                        text="\ue0b4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[3],
                        padding=0,
                        fontsize=38
                    ),
                    widget.Sep(
                        background=colors[0],
                        padding=10,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\ue0b6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[3],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.CurrentLayout(
                        background=colors[3],
                        foreground=colors[5],
                        font="novamono for powerline bold",
                        fontsize=15,
                    ),
                    widget.TextBox(
                        text="\ue0b4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[3],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.CurrentLayoutIcon(
                        custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                        scale=0.45,
                        padding=0,
                        background=colors[0],
                    ),

                    widget.Spacer(),

                    # widget.TextBox(
                    #      text="\ue0b6",
                    #      fonts="droid sans mono for powerline",
                    #      foreground=colors[1],
                    #      background=colors[0],
                    #      padding=0,
                    #      fontsize=38
                    # ),
                    widget.GroupBox(
                        font="space mono for powerline",
                        fontsize=14,
                        margin_y=4,
                        margin_x=4,
                        padding_y=5,
                        padding_x=3,
                        borderwidth=7,
                        inactive=colors[2],
                        active=colors[9],
                        rounded=True,
                        highlight_color=colors[9],
                        highlight_method="block",
                        this_current_screen_border=colors[11],
                        this_screen_border=colors[3],
                        other_screen_border=colors[1],
                        block_highlight_text_color=colors[9],
                        background=colors[0],
                    ),

                    widget.Spacer(),

                    widget.GenPollText(
                        func=get_vpn,
                        update_interval=1,
                    ),

                    widget.Sep(
                        background=colors[0],
                        padding=10,
                        linewidth=0,
                    ),

                    widget.Systray(
                        background=colors[0],
                        foreground=colors[8],
                        icon_size=20,
                        padding=4,
                    ),
                    # widget.TextBox(
                    #     text="\uE0B4",
                    #     fonts="droid sans mono for powerline",
                    #     foreground=colors[6],
                    #     background=colors[0],
                    #     padding=0,
                    #     fontsize=38
                    # ),
                    widget.Backlight(
                        backlight_name="intel_backlight", set=2
                    ),
                    widget.Sep(
                        background=colors[0],
                        padding=10,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\uE0B6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[2],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.TextBox(
                        text="",
                        fonts="droid sans mono for powerline",
                        foreground=colors[5],
                        background=colors[2],
                        padding=0,
                        fontsize=30
                    ),
                    widget.Sep(
                        background=colors[2],
                        padding=8,
                        linewidth=0,
                    ),
                    widget.Volume(
                        background=colors[2],
                        foreground=colors[5],
                        font="novamono for powerline bold",
                        fontsize=16,
                        mouse_callbacks={'Button3': lambda: qtile.cmd_spawn("pavucontrol")},
                        update_interval=0.001,
                    ),
                    widget.TextBox(
                        text="\uE0B4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[2],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.Sep(
                        background=colors[0],
                        padding=10,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\uE0B6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[3],
                        padding=0,
                        fontsize=38
                    ),
                    widget.TextBox(
                        text="",
                        foreground=colors[5],
                        background=colors[3],
                        padding=0,
                        fontsize=38
                    ),
                    widget.CPU(
                        background=colors[3],
                        foreground=colors[5],
                        format=' {load_percent}%',
                        font='novamono for powerline bold',
                        fontsize=16
                    ),
                    widget.Sep(
                        background=colors[3],
                        padding=6,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\uE0B4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[3],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.Sep(
                        background=colors[0],
                        padding=10,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\uE0B6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[7],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.Sep(
                        background=colors[7],
                        padding=3,
                        linewidth=0,
                    ),
                    widget.Battery(
                        foreground=colors[5],
                        background=colors[7],
                        fontsize=24,
                        low_percentage=0.2,
                        low_foreground=colors[5],
                        font="lekton nerd font",
                        update_interval=1,
                        format='{char}',
                        charge_char='ﮣ',
                        discharge_char=' ',
                    ),
                    widget.Sep(
                        background=colors[7],
                        padding=2,
                        linewidth=0,
                    ),
                    widget.Battery(
                        background=colors[7],
                        foreground=colors[5],
                        charge_char='↑',
                        discharge_char='↓',
                        font="novamono for powerline bold",
                        fontsize=16,
                        update_interval=1,
                        format='{percent:2.0%}'
                    ),
                    widget.TextBox(
                        text="\uE0B4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[7],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    widget.Sep(
                        background=colors[0],
                        padding=8,
                        linewidth=0,
                    ),
                    widget.TextBox(
                        text="\uE0B6",
                        fonts="droid sans mono for powerline",
                        foreground=colors[8],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                    # widget.Sep(
                    #     background=colors[8],
                    #     padding=6,
                    #     linewidth=0,
                    # ),
                    widget.TextBox(
                        text="",
                        fonts="novamono for powerline bold",
                        foreground=colors[5],
                        background=colors[8],
                        padding=0,
                        fontsize=28
                    ),
                    widget.Sep(
                        background=colors[8],
                        padding=8,
                        linewidth=0,
                    ),
                    widget.Clock(
                        background=colors[8],
                        foreground=colors[5],
                        font="novamono for powerline bold",
                        fontsize=16,
                        format='%I:%M %p',
                    ),
                    widget.TextBox(
                        text="\ue0b4",
                        fonts="droid sans mono for powerline",
                        foreground=colors[8],
                        background=colors[0],
                        padding=0,
                        fontsize=38
                    ),
                ],
                43,
                background=colors[0],
                margin=[10,6,4,6],
            ),
        )
    for _ in range(screens_nb)
]

#############################################
#############################################
############# AUTOSTART #####################
#############################################
@hook.subscribe.startup_once
def autostart():
    processes = [
        ['slack'],
    ]

    for p in processes:
        subprocess.Popen(p)


# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"
