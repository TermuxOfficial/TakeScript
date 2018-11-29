#!/bin/bash

### Color ###
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
blue='\e[0;34m'
reset='\e[0m'

### Requirements ###
if [ -f /data/data/com.termux/files/usr/bin/curl ];
then 
    sleep 1
    echo -e $blue"[✔]:[ curl ]: $lightgreen Found !" 
else
    echo -e $blue"[x]:[ curl ]: $red Not Found ! "
    echo ""
    sleep 1 
    echo -e $white"installing curl..."
    sleep 1
    apt-get install --force-yes -y curl
fi

echo ""

if [ -f /data/data/com.termux/files/usr/bin/nano ];
then
    sleep 1
    echo -e $blue"[✔]:[ nano ]: $lightgreen Found !"
else 
    echo -e $blue"[x]:[ nano ]: $red Not Found ! "
    echo "" 
    sleep 1 
    echo -e $white"installing nano..." 
    sleep 1 
    apt-get install --force-yes -y nano
fi

echo ""
sleep 1
echo "installation Finished"
echo ""
sleep 1
clear


### Check Internet ###
{
  ping -c 1 google.com > /dev/null
  if [[ "$?" != 0 ]]
  then
    echo  "Checking For Internet: FAILED
    This Script Needs An Active Internet Connection
    Check Connection Your Internet"
    echo "Good Bye 😊"
    echo && sleep 2
    exit
  else
    echo -e $lightgreen"-----------------------------------"
    echo -e $white"Checking For Internet: $red CONNECTED"
    echo -e $lightgreen"-----------------------------------"
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

echo -e $red"["$lightgreen"+"$red"]"$reset"Hay😜 : $ip"

### Function Tools ###
if [ -z "$1" ]; then
        echo -e $red"["$lightgreen"+"$red"]"$white"Usage TakeScript Deface."
        echo -e $red"["$lightgreen"+"$red"]"$reset"Use:" $red"$0" $white"<URL>"$reset
        exit 0
fi

curl $1 -o index.html
echo -e $reset""
echo -e $red"["$lightgreen"+"$red"]"$reset "Success Downloads Files "$1"/index.html"