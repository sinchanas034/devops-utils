#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash file-organizer.sh [directory]"
  echo ""
  echo "Organizes files in a directory into subfolders by type"
  echo "(Images, Documents, Archives, Videos, Others)."
  echo ""
  echo "Options:"
  echo "  [directory]   Folder to organize (default: current folder)"
  echo "  --help        Show this help message"
  echo ""
  echo "Example: bash file-organizer.sh ~/Downloads"
  exit 0
fi

target_dir="${1:-.}"

if [ ! -d "$target_dir" ]; then
  echo "ERROR: '$target_dir' is not a valid directory."
  exit 1
fi

cd "$target_dir" || exit 1

moved_count=0

echo "----- Organizing files in $target_dir -----"

for file in *; do
  if [ -f "$file" ]; then
    ext="${file##*.}"
    ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')

    case "$ext_lower" in
      jpg|jpeg|png|gif|bmp|svg)
        folder="Images" ;;
      pdf|doc|docx|txt|xlsx|ppt|pptx)
        folder="Documents" ;;
      zip|rar|tar|gz|7z)
        folder="Archives" ;;
      mp4|mkv|avi|mov)
        folder="Videos" ;;
      *)
        folder="Others" ;;
    esac

    mkdir -p "$folder"
    mv "$file" "$folder/" 2>/dev/null && {
      echo "Moved: $file -> $folder/"
      moved_count=$((moved_count + 1))
    }
  fi
done

echo ""
echo "Done. $moved_count file(s) organized."
