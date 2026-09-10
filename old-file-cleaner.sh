#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash old-file-cleaner.sh <directory> <days> [--delete]"
  echo ""
  echo "Finds files older than a given number of days."
  echo "By default, only LISTS files (safe). Use --delete to actually remove them."
  echo ""
  echo "Options:"
  echo "  <directory>   Folder to scan"
  echo "  <days>        Delete files older than this many days"
  echo "  --delete      Actually delete the files (without this, it's a dry run)"
  echo "  --help        Show this help message"
  echo ""
  echo "Example: bash old-file-cleaner.sh ~/Downloads 30"
  echo "Example: bash old-file-cleaner.sh ~/Downloads 30 --delete"
  exit 0
fi

target_dir="$1"
days="$2"
mode="$3"

if [ -z "$target_dir" ] || [ -z "$days" ]; then
  echo "Usage: bash old-file-cleaner.sh <directory> <days> [--delete]"
  echo "Example: bash old-file-cleaner.sh ~/Downloads 30"
  exit 1
fi

if [ ! -d "$target_dir" ]; then
  echo "ERROR: '$target_dir' is not a valid directory."
  exit 1
fi

if [ "$mode" == "--delete" ]; then
  echo "----- DELETING files older than $days days in $target_dir -----"
  count=$(find "$target_dir" -type f -mtime +"$days" -print -delete | wc -l)
  echo ""
  echo "Deleted $count file(s)."
else
  echo "----- DRY RUN: Files older than $days days in $target_dir -----"
  echo "(No files will be deleted. Add --delete to actually remove them.)"
  echo ""
  find "$target_dir" -type f -mtime +"$days"
  count=$(find "$target_dir" -type f -mtime +"$days" | wc -l)
  echo ""
  echo "$count file(s) would be deleted."
fi
