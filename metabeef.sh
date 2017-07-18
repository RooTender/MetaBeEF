#!/bin/bash

#===========================================#
# This script will run BeEF with metasploit #
#===========================================#




### Setup Metasploit ###
xterm -e msfconsole -q -x "workspace default; load msgrpc ServerHost=192.168.0.15 Pass=abc123" & cd /usr/share/beef-xss/
sleep 8
./beef
