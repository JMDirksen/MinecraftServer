#!/bin/bash
cd "$(dirname "$0")"
touch "server/stop"
screen -S "bedrock" -p 0 -X stuff "stop^M"
while screen -list | grep -q "bedrock"
do
    sleep 1
done
[ -f "server/stop" ] && rm "server/stop"
