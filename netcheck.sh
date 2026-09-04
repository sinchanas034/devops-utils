#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash netcheck.sh"
  echo ""
  echo "Checks internet connectivity, DNS resolution, and common services."
  echo ""
  echo "Options:"
  echo "  --help    Show this help message"
  exit 0
fi

echo "----- Network Connectivity Check -----"

echo ""
echo "Checking internet connectivity (ping 8.8.8.8)..."
if ping -n 2 8.8.8.8 > /dev/null 2>&1; then
  echo "OK: Internet is reachable."
else
  echo "FAIL: No internet connection detected."
fi

echo ""
echo "Checking DNS resolution (google.com)..."
if ping -n 2 google.com > /dev/null 2>&1; then
  echo "OK: DNS is resolving correctly."
else
  echo "FAIL: DNS resolution failed."
fi

echo ""
echo "Checking common services:"
sites=("github.com" "google.com" "wikipedia.org")
for site in "${sites[@]}"; do
  if ping -n 1 "$site" > /dev/null 2>&1; then
    echo "  OK: $site is reachable"
  else
    echo "  FAIL: $site is NOT reachable"
  fi
done
