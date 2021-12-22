#!/bin/bash
cd "$(dirname "$0")"
touch "server/stop"
screen -S "java" -p 0 -X stuff "stop^M"
while screen -list | grep -q "java"
do
    sleep 1
done
[ -f "server/stop" ] && rm "server/stop"
