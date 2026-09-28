#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash port-checker.sh [port]"
  echo ""
  echo "Shows all listening ports and services on this machine."
  echo "If a port number is given, checks whether that specific port is in use."
  echo ""
  echo "Options:"
  echo "  [port]    Check a specific port number"
  echo "  --help    Show this help message"
  echo ""
  echo "Example: bash port-checker.sh 8080"
  exit 0
fi

if [ -n "$1" ]; then
  echo "----- Checking port $1 -----"
  result=$(netstat -an | grep ":$1 " | grep "LISTENING")
  if [ -n "$result" ]; then
    echo "Port $1 is IN USE:"
    echo "$result"
  else
    echo "Port $1 is free (not in use)."
  fi
else
  echo "----- All Listening Ports -----"
  netstat -an | grep "LISTENING"
fi
