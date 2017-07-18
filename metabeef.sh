#!/bin/bash

### Config ###

# Launch Directly - set to true if you want to Launch MetaBeEF without menu
DirectL=false

# BeEF Path
BeefPath="/usr/share/beef-xss/"

# Metasploit PATH
MetaPath="/usr/share/metasploit-framework/"

# BeEF Launch Delay (minimum 8s) - Metasploit must run first and the process of heating up takes some time...
DELAY=8s

### End of Config ###

#===========================================#
# This script will run BeEF with Metasploit #
#===========================================#

# Color variables
BLACK='\033[1;30m'
GREEN='\033[1;32m'
lGREEN='\033[0;32m'
WHITE='\033[1;37m'
lWHITE='\033[0;37m'
BLUE='\033[1;34m'
lBLUE='\033[0;34m'
GREY='\033[0;37m'
RED='\033[1;31m'
lRED='\033[0;31m'
YELLOW='\033[1;33m'
lYELLOW='\033[0;33m'
CYAN='\033[1;36m'
lCYAN='\033[0;36m'
NC='\033[0m'

# Other Variables
Spd=0.1s

# Show your self!
function banner {
clear
echo
sleep $Spd
echo -e "    ${BLUE} _/      _/          ${WHITE}  _/              ${BLACK}_/_/_/            ${WHITE}_/_/_/_/ _/_/_/_/"
sleep $Spd
echo -e "   ${BLUE} _/_/  _/_/   _/_/   ${WHITE}_/_/_/_/   _/_/_/ ${BLACK}_/    _/   _/_/   ${WHITE}_/       _/       "
sleep $Spd
echo -e "  ${BLUE} _/  _/  _/ _/_/_/_/ ${WHITE}  _/     _/    _/ ${BLACK}_/_/_/   _/_/_/_/ ${WHITE}_/_/_/   _/_/_/    "
sleep $Spd
echo -e " ${BLUE} _/      _/ _/       ${WHITE}  _/     _/    _/ ${BLACK}_/    _/ _/       ${WHITE}_/       _/         "
sleep $Spd
echo -e "${BLUE} _/      _/   _/_/_/ ${WHITE}    _/_/   _/_/_/ ${BLACK}_/_/_/     _/_/_/ ${WHITE}_/_/_/_/ _/          "
sleep 1.25
echo
}

### Messages ###

# Success

function Success {
  echo -e "     ${GREY}[${GREEN}OK${GREY}]  ${lGREEN}$1"
}

# Info
function Info {
  echo -e "    ${GREY}[${WHITE}INFO${GREY}] ${lWHITE}$1"
}

# Warning
function Warning {
  echo -e "    ${GREY}[${YELLOW}WARNING${GREY}] ${lYELLOW}$1"
}

# Critical
function Critical {
  echo -e "    ${GREY}[${RED}FAIL${GREY}] ${lRED}$1"
}

# Spaces
function Spaces {
  echo "           $1"
}

### Messages ###

#Find beef and Metasploit pathes
function CheckPaths {

Info "Checking Beef and Metasploit availability"
sleep 0.5s

if [ -d "$BeefPath" ]; then
  Success "Beef has been found!"
  sleep 0.5s
else
  Critical "MetaBeEF is unable to find BeEF files!"
    Spaces "Current path is: ($BeefPath)."
    Spaces "If you've got BeEF installed, please enter right path in the script."
  echo
  exit
fi

if [ -d "$MetaPath" ]; then
  Success "Metasploit has been found!"
  sleep 0.5s
else
  Critical "MetaBeEF is unable to find Metasploit files!"
    Spaces "Current path is: ($MetaPath)."
    Spaces "If you've got Metasploit installed, please enter right path in the script."
  echo
  exit
fi
}

#Menu
function Menu {
while [ 0!=1 ]; do
	clear
        banner
	echo -e ${lCYAN}
        echo -e "    1. Launch BeEF"
        echo -e "    2. Setup config for MetaBeEF"
        echo -e "    3. Backup an old config"
        echo -e "    4. Exit"
	echo
	read -p "    Your choice: " ans

	if [ "$ans" == '1' ]; 
	  then
	    Launch
	
	elif [ "$ans" == '2' ];
	  then
            echo
            Warning "Sorry, but MetaBeEF is still WIP. This feature is comming soon..."
            sleep 3s
            echo
	    
	elif [ "$ans" == '3' ];
	  then
            echo
            Warning "Sorry, but MetaBeEF is still WIP. This feature is comming soon..."
            sleep 3s
            echo

	elif [ "$ans" == '4' ];
	  then
            echo
            echo -e "    ${WHITE}Thanks for using MetaBeEF tool! Goodbye"
            sleep 2s
            echo
            clear
            exit

        else
	  echo 
          echo "    Pick your option from list (1-4)"
          sleep 3s
        fi
done
}

###### ===== LAUNCH ===== ######
function Launch {
  xterm -e msfconsole -x "workspace default; load msgrpc ServerHost=192.168.0.15 Pass=abc123" & cd $BeefPath
  banner
  echo
  Info "To terminate the process press ${WHITE}CTRL+C"
  Info "Attempting to launch BeEF"
  sleep $DELAY
  Success "Let's make some noice...${NC}"
  echo
  ./beef
}

### ===== Main Script Queue ===== ###
if [ "$DirectL" == true ];
  then
    Launch

else
    banner
    CheckPaths
    Menu
fi
