#!/bin/bash

# Define target directory
TARGET_DIR=~/projects/microblog
BACKUP_DIR="$TARGET_DIR/backup_$(date +%Y%m%d_%H%M%S)"

# Confirm overwrite
echo "This will overwrite the app folder, requirements.txt, and microblog.py in $TARGET_DIR"
echo "A backup will be saved to: $BACKUP_DIR"
read -p "Are you sure you want to continue? (y/n): " confirm

if  "$confirm" != "y" ; then
	echo "Aborted."
	exit 1
fi

# Create backup directory
mkdir -p "$BACKUP_DIR"

# Backup existing files if they exist
if [ -d "$TARGET_DIR/app" ]; then
	cp -r "$TARGET_DIR/app" "$BACKUP_DIR/"
fi

if [ -f "$TARGET_DIR/requirements.txt" ]; then
	cp "$TARGET_DIR/requirements.txt" "$BACKUP_DIR/"
fi

if [ -f "$TARGET_DIR/microblog.py" ]; then
	cp "$TARGET_DIR/microblog.py" "$BACKUP_DIR/"
fi

# Copy new files
cp -r app "$TARGET_DIR/"
cp requirements.txt "$TARGET_DIR/"
cp microblog.py "$TARGET_DIR/"

echo "Chapter 15 files copied successfully to $TARGET_DIR"
echo "Original files backed up to $BACKUP_DIR"
