# Lab 2 — Basic Linux File and Directory Commands

## Project overview

This project practices the Linux commands and shell operators in the Lab 2 task. The script creates a `lab2` directory in the current user's home directory, creates and edits a text file, copies and moves files, searches for `.txt` files, and then removes the lab files.

The project contains:

- `lab2_commands.sh` — the Bash script that performs the lab steps.
- `README.md` — this guide, including an explanation of every script line and the commands used.

## Requirements

- A Linux terminal or another environment that provides Bash and the standard commands used below.
- A user account with permission to create and remove files in its own home directory.

## How to run

1. Extract the ZIP file, if you downloaded the ZIP version.
2. Open a terminal and move into the extracted project directory.
3. Make the script executable (you only need to do this once):

   ```bash
   chmod +x lab2_commands.sh
   ```

4. Run it:

   ```bash
   ./lab2_commands.sh
   ```

The script uses the value of `$HOME`, so it works from any starting directory and performs the lab inside that user's home directory.

> **Important:** The script removes the `~/lab2` directory at the end. It first checks whether `~/lab2` already exists. If it does, the script stops rather than overwriting or deleting your existing files. Rename or move that directory before running the script.

## What the script does

1. Checks that `~/lab2` is not already present.
2. Creates `~/lab2`, enters it, and prints the current working directory with `pwd`.
3. Creates `notes.txt` using `touch` and displays its details with `ls -l`.
4. Writes a first line using `>` and appends a second line using `>>`.
5. Displays the file with `cat` and counts its lines with `wc -l`.
6. Creates `backup`, copies `notes.txt` into it with `cp`, renames the original with `mv`, and moves the renamed file into `backup`.
7. Lists `lab2` and `backup` with detailed output.
8. Searches the home directory for names ending in `.txt` with `find`.
9. Returns home, removes the non-empty `backup` directory with `rm -r`, removes the now-empty `lab2` directory with `rmdir`, and lists the home directory.

## Line-by-line code explanation

The line numbers below match `lab2_commands.sh`. Blank lines are included so that the explanation maps directly to the file.

| Line | Code | Explanation |
|---:|---|---|
| 1 | `#!/usr/bin/env bash` | Shebang. It tells the operating system to run this file with Bash, found through `env`. |
| 2 | `# Student: Loai Mustafa el_afify` | Comment containing the student's name. Bash ignores comment text. |
| 3 | `# Lab 2: Practicing basic Linux file and directory commands` | Comment describing the purpose of the script. |
| 4 | *(blank)* | Separates the header from the commands for readability. |
| 5 | `set -euo pipefail` | Enables safer Bash behavior: `-e` stops on an unhandled command failure, `-u` treats unset variables as errors, and `pipefail` makes a pipeline fail when a command in it fails. |
| 6 | *(blank)* | Visual separator. |
| 7 | `# Save the home directory and the path that will be used for this lab.` | Comment introducing the path variables. |
| 8 | `HOME_DIR="$HOME"` | Stores the current user's home-directory path in `HOME_DIR`. `$HOME` is an environment variable. |
| 9 | `LAB_DIR="$HOME_DIR/lab2"` | Builds the full path to the `lab2` directory and stores it in `LAB_DIR`. |
| 10 | *(blank)* | Visual separator. |
| 11 | `# Stop instead of overwriting an existing lab2 file or directory.` | Comment explaining the safety check. |
| 12 | `if [[ -e "$LAB_DIR" || -L "$LAB_DIR" ]]; then` | Starts a conditional. `-e` checks whether the path exists; `-L` also detects a symbolic link, including a broken one. `||` means OR. |
| 13 | `printf 'Error: %s already exists. Rename it or remove it before running this lab.\n' "$LAB_DIR" >&2` | Prints an error message to standard error (`>&2`) when the path is already present. The `%s` placeholder is replaced by the value of `LAB_DIR`, and `\n` adds a newline. |
| 14 | `exit 1` | Stops the script and returns exit status `1`, which signals failure. |
| 15 | `fi` | Ends the `if` conditional. |
| 16 | *(blank)* | Visual separator. |
| 17 | `# Move to the home directory, create lab2, enter it, and print the current path.` | Comment describing the next four commands. |
| 18 | `cd "$HOME_DIR"` | Changes the current working directory to the user's home directory. `cd` means change directory. |
| 19 | `mkdir lab2` | Creates a new directory named `lab2`. `mkdir` means make directory. |
| 20 | `cd lab2` | Enters the newly created `lab2` directory. |
| 21 | `pwd` | Prints the full path of the current working directory. |
| 22 | *(blank)* | Visual separator. |
| 23 | `# Create an empty notes.txt file and show its detailed listing.` | Comment describing file creation and listing. |
| 24 | `touch notes.txt` | Creates an empty `notes.txt` file. If it already existed, `touch` would update its timestamps; in this script the file is new. |
| 25 | `ls -l notes.txt` | Lists the file in long format, showing details such as permissions, owner, size, date, and name. |
| 26 | *(blank)* | Visual separator. |
| 27 | `# Put the first line in the file with >, then append a second line with >>.` | Comment explaining output redirection. |
| 28 | `printf '%s\n' 'This is the first line in notes.txt.' > notes.txt` | `printf` prints the text and a newline. `>` redirects the output into the file and replaces its previous contents. |
| 29 | `printf '%s\n' 'This is the second line in notes.txt.' >> notes.txt` | Prints another line. `>>` appends output to the end of the file without replacing the first line. |
| 30 | *(blank)* | Visual separator. |
| 31 | `# Display the file contents and count its lines.` | Comment describing the next two commands. |
| 32 | `cat notes.txt` | Displays the contents of `notes.txt`. `cat` is commonly used to print or combine file contents. |
| 33 | `wc -l notes.txt` | Counts the newline-terminated lines in the file. `wc` means word count; `-l` selects line counting. |
| 34 | *(blank)* | Visual separator. |
| 35 | `# Create a backup directory, copy the file, rename the original, and move it into backup.` | Comment describing the directory and file operations. |
| 36 | `mkdir backup` | Creates a directory named `backup` inside `lab2`. |
| 37 | `cp notes.txt backup/` | Copies `notes.txt` into `backup`. The original file remains in `lab2` after copying. `cp` means copy. |
| 38 | `mv notes.txt renamed_notes.txt` | Renames the original file to `renamed_notes.txt`. `mv` means move; when the destination is a filename in the same directory, it renames the file. |
| 39 | `mv renamed_notes.txt backup/` | Moves the renamed file into the `backup` directory. |
| 40 | *(blank)* | Visual separator. |
| 41 | `# List lab2 and then list the backup directory with details.` | Comment introducing the directory listings. |
| 42 | `ls -la "$LAB_DIR"` | Lists the contents of `lab2` in long format, including hidden entries. `-a` includes hidden entries and `-l` shows details. |
| 43 | `ls -l backup` | Lists the contents of `backup` in long format. It should show both `notes.txt` and `renamed_notes.txt`. |
| 44 | *(blank)* | Visual separator. |
| 45 | `# Search the home directory and all of its subdirectories for .txt files.` | Comment describing the recursive search. |
| 46 | `find ~ -name "*.txt"` | Searches the home directory (`~`) and its subdirectories for paths whose names match `*.txt`. The quotes prevent the shell from expanding the wildcard before `find` receives it. |
| 47 | *(blank)* | Visual separator. |
| 48 | `# Return home, remove the non-empty backup directory with rm -r,` | Comment explaining the first cleanup step. |
| 49 | `# remove the now-empty lab2 directory with rmdir, and list the home directory.` | Continues the cleanup explanation. |
| 50 | `cd "$HOME_DIR"` | Returns to the user's home directory before deleting the lab directory. |
| 51 | `rm -r "$LAB_DIR/backup"` | Removes `backup` and everything inside it. `rm` means remove; `-r` means recursive, allowing directory contents to be removed. |
| 52 | `rmdir "$LAB_DIR"` | Removes `lab2`. `rmdir` only removes an empty directory; the previous command makes `lab2` empty. |
| 53 | `ls -la "$HOME_DIR"` | Lists the home directory, including hidden entries, in long format so you can confirm that `lab2` is gone. |

## Commands and symbols used

| Command / symbol | Meaning |
|---|---|
| `pwd` | Print the current working directory. |
| `mkdir` | Create a directory. |
| `cd` | Change the current directory. |
| `touch` | Create an empty file or update a file's timestamps. |
| `ls -l` | Show a detailed file or directory listing. |
| `>` | Redirect output into a file, replacing its contents. |
| `>>` | Append redirected output to the end of a file. |
| `printf` | Print formatted text. |
| `cat` | Display file contents. |
| `wc -l` | Count lines. |
| `cp` | Copy files or directories. |
| `mv` | Move or rename files and directories. |
| `find` | Search for files and directories that match criteria. |
| `rm -r` | Remove a directory and its contents recursively. Use carefully. |
| `rmdir` | Remove an empty directory only. |
| `~` | Shorthand for the current user's home directory. |
| `$HOME` | Environment variable containing the user's home-directory path. |
| `*.txt` | Wildcard pattern matching names ending in `.txt`. |

## Expected result

Before cleanup, `backup` contains two files:

```text
backup/
├── notes.txt
└── renamed_notes.txt
```

Both files contain the same two lines because the original file is copied before it is renamed and moved. At the end, `~/lab2` is removed, and the script prints the home-directory listing.

## Notes

- There are no user-defined functions in this script. The assignment is a sequence of shell commands, so the README explains each command and every line instead.
- The script intentionally does not use `sudo`; it should only modify the current user's home directory.
- The `find` command may display many `.txt` files already present in your home directory. That is normal.
