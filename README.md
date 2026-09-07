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

### Why I built this
A place to collect small, useful scripts as I keep learning Linux and automation - rather than one big project,this grows over time with practical,standalone tools.
