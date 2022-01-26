vpn_name=$(systemctl list-units | grep openvpn-client@ | cut -d @ -f2 | cut -d . -f1)

if [ -z $vpn_name ]; then
    echo "VPN: X"
else
    echo "VPN: $vpn_name"
fi


