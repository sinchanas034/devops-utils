#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash password-generator.sh [length]"
  echo ""
  echo "Options:"
  echo "  [length]   Password length (default: 12)"
  echo "  --help     Show this help message"
  echo ""
  echo "Example: bash password-generator.sh 16"
  exit 0
fi

length="${1:-12}"

password=$(tr -dc 'A-Za-z0-9!@#$%^&*()' < /dev/urandom | head -c "$length")

echo "Generated password: $password"

