#!/bin/bash

### Color ###
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
blue='\e[0;34m'
reset='\e[0m'

### Check Internet ###
{
  ping -c 1 google.com > /dev/null
  if [[ "$?" != 0 ]]
  then
    echo  "Checking For Internet: FAILED
    This Script Needs An Active Internet Connection"
    echo " Good Bye 😊"
    echo && sleep 2
    exit
  else
    echo -e $lightgreen " -----------------------------------"
    echo -e $white " Checking For Internet: $red CONNECTED"
    echo -e $lightgreen " -----------------------------------"
  fi
}

### User IP Public ###
ip=$(curl -s https://api.ipify.org)

### Function Banner ###
echo -e $blue"++++++++++++++++++++++++++++++++++"
echo -e $red"╔══╗╔══╗╔╦╗╔═╗╔══╗╔═╗╔═╗╔══╗╔═╗╔══╗"$blue"+"
echo -e $red"╚╗╔╝║╔╗║║╔╝║╦╝║══╣║╔╝║╬║╚║║╝║╬║╚╗╔╝"$blue"+"
echo -e $red"─║║─║╠╣║║╚╗║╩╗╠══║║╚╗║╗╣╔║║╗║╔╝─║║─"$blue"+"
echo -e $red"─╚╝─╚╝╚╝╚╩╝╚═╝╚══╝╚═╝╚╩╝╚══╝╚╝──╚╝─"$blue"+"
echo -e $blue"++++++++++++++++++++++++++++++++++"

echo -e $red"["$lightgreen"+"$red"]"$reset "My IP address : $ip"

### Function Tools ###
if [ -z "$1" ]; then
        echo -e $red"["$lightgreen"+"$red"]"$white"Usage TakeScript Deface."
        echo -e $reset "Use:" $red"$0" $white"<URL>"$reset
        exit 0
fi

curl $1 -o index.html
echo -e $reset""
echo -e $red"["$lightgreen"+"$red"]"$reset "Success Downloads Files"$1"/index.html"