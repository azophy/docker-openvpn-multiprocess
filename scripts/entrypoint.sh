#!/usr/bin/env bash

# decode vpn config into file
echo $VPN_CONFIG_FILE_CONTENT | base64 -d > /vpn/openvpn.conf

# run supervisord
/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
