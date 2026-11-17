#!/usr/bin/env bash
# Student: Loai Mustafa el_afify
# Lab 2: Practicing basic Linux file and directory commands

set -euo pipefail

# Save the home directory and the path that will be used for this lab.
HOME_DIR="$HOME"
LAB_DIR="$HOME_DIR/lab2"

# Stop instead of overwriting an existing lab2 file or directory.
if [[ -e "$LAB_DIR" || -L "$LAB_DIR" ]]; then
    printf 'Error: %s already exists. Rename it or remove it before running this lab.\n' "$LAB_DIR" >&2
    exit 1
fi

# Move to the home directory, create lab2, enter it, and print the current path.
cd "$HOME_DIR"
mkdir lab2
cd lab2
pwd

# Create an empty notes.txt file and show its detailed listing.
touch notes.txt
ls -l notes.txt

# Put the first line in the file with >, then append a second line with >>.
printf '%s\n' 'This is the first line in notes.txt.' > notes.txt
printf '%s\n' 'This is the second line in notes.txt.' >> notes.txt

# Display the file contents and count its lines.
cat notes.txt
wc -l notes.txt

# Create a backup directory, copy the file, rename the original, and move it into backup.
mkdir backup
cp notes.txt backup/
mv notes.txt renamed_notes.txt
mv renamed_notes.txt backup/

# List lab2 and then list the backup directory with details.
ls -la "$LAB_DIR"
ls -l backup

# Search the home directory and all of its subdirectories for .txt files.
find ~ -name "*.txt"

# Return home, remove the non-empty backup directory with rm -r,
# remove the now-empty lab2 directory with rmdir, and list the home directory.
cd "$HOME_DIR"
rm -r "$LAB_DIR/backup"
rmdir "$LAB_DIR"
ls -la "$HOME_DIR"
