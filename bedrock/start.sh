#!/bin/bash
cd "$(dirname "$0")"
screen -dmS "bedrock" "./loop.sh"
