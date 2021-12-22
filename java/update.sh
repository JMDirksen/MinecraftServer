#!/bin/bash
cd "$(dirname "$0")"

# Get current version
[ -f "version.txt" ] && current_version_build=$(cat "version.txt") || current_version_build=0
echo "Current version: $current_version_build"

# Get latest version
versions_url="https://api.papermc.io/v2/projects/paper"
version=$(curl -s "$versions_url" | jq -r ".versions[-1]")
builds_url="https://api.papermc.io/v2/projects/paper/versions/$version"
build=$(curl -s "$builds_url" | jq -r ".builds[-1]")
version_build="$version #$build"

echo "Latest build: $version_build"

# Exit if up-to-date
[ "$current_version_build" = "$version_build" ] && { echo "Up-to-date"; exit; }

# Stopping server
echo "Stopping server..."
bash "stop.sh"

# Download new version
echo "Downloading new version..."
build_url="https://api.papermc.io/v2/projects/paper/versions/$version/builds/$build"
name=$(curl -s "$build_url" | jq -r ".downloads.application.name")
download_url="https://api.papermc.io/v2/projects/paper/versions/$version/builds/$build/downloads/$name"
wget -q "$download_url" -O "server/server.jar"
echo "$version_build" > "version.txt"
echo "Updated!"

# Starting server
echo "Starting server..."
bash "start.sh"
echo "Done."
