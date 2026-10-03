#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash git-health-check.sh [directory]"
  echo ""
  echo "Checks a Git repository for uncommitted changes and unpushed commits."
  echo ""
  echo "Options:"
  echo "  [directory]   Path to a Git repo (default: current folder)"
  echo "  --help        Show this help message"
  echo ""
  echo "Example: bash git-health-check.sh ~/projects/syscheck"
  exit 0
fi

target_dir="${1:-.}"

if [ ! -d "$target_dir/.git" ]; then
  echo "ERROR: '$target_dir' is not a Git repository (no .git folder found)."
  exit 1
fi

cd "$target_dir" || exit 1

echo "===== Git Health Check: $target_dir ====="
echo ""

echo "----- Uncommitted Changes -----"
changes=$(git status --porcelain)
if [ -n "$changes" ]; then
  echo "You have uncommitted changes:"
  echo "$changes"
else
  echo "Clean - no uncommitted changes."
fi

echo ""
echo "----- Unpushed Commits -----"
unpushed=$(git log @{u}.. --oneline 2>/dev/null)
if [ -n "$unpushed" ]; then
  echo "You have unpushed commits:"
  echo "$unpushed"
else
  echo "Clean - everything is pushed."
fi

echo ""
echo "----- Current Branch -----"
git branch --show-current

echo ""
echo "===== End of Health Check ====="
