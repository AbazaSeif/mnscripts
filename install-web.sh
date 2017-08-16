#!/bin/bash

cd ~/
mkdir web
cd web
wget https://raw.githubusercontent.com/chaoabunga/chc-scripts/master/index.html
wget https://raw.githubusercontent.com/chaoabunga/chc-scripts/master/stats.txt
(crontab -l 2>/dev/null; echo "* * * * * /usr/local/bin/chaincoind getinfo > ~/web/stats.txt") | crontab -
mnip=$(curl -s https://api.ipify.org)
python3 -m http.server 8000 --bind $mnip > /dev/null &
echo "Web Server Started!  You can now access your stats page at http://$mnip:8000"
