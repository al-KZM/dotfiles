from libqtile import widget
import subprocess

class VpnChecker(widget.GenPollText):
    """A simple widget to display if a given Vconnection is launched or not.
    This widget uses (so: needs) network manager's nmcli tool.
    A classic (and default) use case is to check if a vpn is ON or OFF and
    display a corresponding lock icon.
    setup the 'name' option to parse the output of the nmcli command.
    """

    defaults = [
        ("update_interval", 30, "Update time in seconds."),
        ("name", 'vpn', "name"),
        ("color_ok", "55cc55", "color_ok"),
        ("color_nok", "cc5555", "color_nok"),
        ("fmt_ok", "\U0001F510", "fmt_ok"),
        ("fmt_nok", "\U0001F513", "fmt_nok"),
    ]

    def poll(self):
        """Use script to poll VPN status."""
        p = subprocess.run(
            ["sh", f"{HOME}/.config/scripts/check_running_openvpn.sh"],
            capture_output=True
        )
        return p.stdout.decode('utf-8')

    def button_press(self, x, y, button):
        """handle mouse button press on the widget."""
        if button == 1 and self.last_output:  # left click
            network_name = self.last_output.split(' ')[0]
            subprocess.call(
                '/usr/bin/notify-send -u low -t 1000 -a ConnectionStatus '
                '-c info "connected to: %s"' % network_name, shell=True)
