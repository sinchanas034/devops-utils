#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash duplicate-finder.sh [directory]"
  echo ""
  echo "Finds duplicate files in a directory based on content (not just name)."
  echo ""
  echo "Options:"
  echo "  [directory]   Folder to scan (default: current folder)"
  echo "  --help        Show this help message"
  echo ""
  echo "Example: bash duplicate-finder.sh ~/Downloads"
  exit 0
fi

target_dir="${1:-.}"

if [ ! -d "$target_dir" ]; then
  echo "ERROR: '$target_dir' is not a valid directory."
  exit 1
fi

echo "----- Scanning for duplicate files in $target_dir -----"

find "$target_dir" -type f -exec md5sum {} \; | sed 's/^\(\S*\) \*/\1 /' | sort | awk '
{
  hash=$1
  $1=""
  file=$0
  if (hash in seen) {
    if (!(hash in printed)) {
      print "Duplicate group:"
      print "  " seen[hash]
      printed[hash]=1
    }
    print "  " file
  } else {
    seen[hash]=file
  }
}'

echo ""
echo "Scan complete."
