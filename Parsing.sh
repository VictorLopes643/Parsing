#!/bin/bash

if [ "$1" == "" ]
then
	echo "Parsing em HTML code"
	echo "----Nego-Jao----"
	echo "$0 www.alvo.com"
else 
	wget -q $1
	mv index.html $1.html
	echo "###########################"
	echo "     BUSCANDO HOSTS        "
	echo "###########################"
	grep "href" $1.html | cut -d "/" -f 3 | cut -d '"' -f 1 | grep -v "<" | grep -v "=" | grep -v "(" | grep "\." | sort -u > $1.hosts
	echo "############################"
	echo "    Resolvendo Hosts        "
	echo "############################"
	for h in $(cat "$1.hosts");do host $h;done | grep "has address" > $1.ip
	cat $1.hosts
	cat $1.ip
	fi
