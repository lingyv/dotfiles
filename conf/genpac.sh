#!/bin/bash
cd ~/Documents
mkdir pac
cd pac
touch user-rules.txt
sudo pip install genpac
pip install --upgrade genpac
genpac -p "SOCKS5 127.0.0.1:1080" --gfwlist-proxy="SOCKS5 127.0.0.1:1080" --output="autoproxy.pac" --gfwlist-url="https://raw.githubusercontent.com/gfwlist/gfwlist/master/gfwlist.txt" --user-rule-from="user-rules.txt"
# file:///home/{user}/Documents/pac/autoproxy.pac
