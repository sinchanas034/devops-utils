#!/bin/bash

if [ "$1" == "--help" ]; then
  echo "Usage: bash sysinfo.sh"
  echo ""
  echo "Prints a quick snapshot of system information:"
  echo "OS, hostname, user, uptime, disk, and memory."
  echo ""
  echo "Options:"
  echo "  --help    Show this help message"
  exit 0
fi

echo "===== System Info Snapshot ====="
echo "Generated: $(date)"
echo ""

echo "----- Hostname & User -----"
echo "Hostname: $(hostname)"
echo "User: $(whoami)"

echo ""
echo "----- OS Info -----"
uname -a

echo ""
echo "----- Uptime -----"
uptime 2>/dev/null || echo "Uptime not available in this environment."

echo ""
echo "----- Disk Usage -----"
df -h 2>/dev/null | head -5

echo ""
echo "----- Memory -----"
free -h 2>/dev/null || echo "Memory info not available in Git Bash (try WSL or real Linux)."

echo ""
echo "----- Git Version -----"
git --version

echo ""
echo "===== End of Snapshot ====="
