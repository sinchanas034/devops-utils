# devops-utils

A growing collection of small Bash utility scripts for automation and everyday DevOps tasks.

## Tools

### password-generator.sh
Generates a random, secure password of a specified length.

Usage:
bash password-generator.sh [length]
bash password-generator.sh --help

Example:
bash password-generator.sh 16

### disk-hogs.sh
Finds the largest files and folders in a directory, sorted by size.

Usage:
bash disk-hogs.sh [directory] [count]
bash disk-hogs.sh --help

Example:
bash disk-hogs.sh ~/Downloads 5

### netcheck.sh
Checks internet connectivity, DNS resolution, and reachability of common services.

Usage:
bash netcheck.sh
bash netcheck.sh --help

### file-organizer.sh
Organizes files in a directory into subfolders by type (Images, Documents, Archives, Videos, Others).

Usage:
bash file-organizer.sh [directory]
bash file-organizer.sh --help

Example:
bash file-organizer.sh ~/Downloads

### duplicate-finder.sh
Finds duplicate files in a directory based on content (using MD5 hashing), not just filename.

Usage:
bash duplicate-finder.sh [directory]
bash duplicate-finder.sh --help

Example:
bash duplicate-finder.sh ~/Downloads

### old-file-cleaner.sh
Finds and optionally deletes files older than a specified number of days. Defaults to a safe dry-run mode that only lists files unless --delete is passed.

Usage:
bash old-file-cleaner.sh <directory> <days> [--delete]
bash old-file-cleaner.sh --help

Example:
bash old-file-cleaner.sh ~/Downloads 30
bash old-file-cleaner.sh ~/Downloads 30 --delete

### port-checker.sh
Lists all listening ports on the machine, or checks whether a specific port is in use.

Usage:
bash port-checker.sh [port]
bash port-checker.sh --help

Example:
bash port-checker.sh 8080

## Why I built this
A place to collect small, useful scripts as I keep learning Linux and automation - rather than one big project, this grows over time with practical, standalone tools.
