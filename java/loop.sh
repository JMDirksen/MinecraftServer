#!/bin/bash
cd "$(dirname "$0")"
[[ -f ../config.conf ]] && . ../config.conf || { echo "Config not found"; exit; }
cd server
while true
do
  java -Xms$MEMORY -Xmx$MEMORY -jar server.jar
  [ -f stop ] && { rm stop;  exit; }
  echo 'Press Ctrl-C to stop'
  sleep 5
done
