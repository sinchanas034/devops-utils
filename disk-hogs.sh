#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash disk-hogs.sh [directory] [count]"
  echo ""
  echo "Options:"
  echo "  [directory]   Folder to scan (default: current folder)"
  echo "  [count]       Number of results to show (default: 10)"
  echo "  --help        Show this help message"
  echo ""
  echo "Example: bash disk-hogs.sh ~/Downloads 5"
  exit 0
fi

target_dir="${1:-.}"
count="${2:-10}"

if [ ! -d "$target_dir" ]; then
  echo "ERROR: '$target_dir' is not a valid directory."
  exit 1
fi

echo "----- Top $count Largest Items in $target_dir -----"
du -ah "$target_dir" 2>/dev/null | sort -rh | head -n "$count"
