#!/bin/bash

PID_TORNADO=""
PID_NODE=""

PID_TORNADO=`sudo ps x | grep "server.py" | awk '{print $1}'`
PID_NODE=`sudo ps x | grep "headless.js" | awk '{print $1}'`

if [ "$PID_NODE" != "" ]
then
	echo "kill node... pid -> $PID_NODE"
	`sudo kill -9 $PID_NODE`
fi

if [ "$PID_TORNADO" != "" ]
then
	echo "kill tornado..."
	for pid in $PID_TORNADO
	do
		echo "kill tornado... pid -> $pid"
		`sudo kill -9 $pid`
	done
fi

echo "Run tornado & nodejs servers..."
DIR=`dirname $0`
cd $DIR
cmd="sudo python3 /home/ubuntu/Cozmo-Hosting/server/server.py"
$cmd &

