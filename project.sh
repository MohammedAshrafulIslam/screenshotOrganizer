#!/bin/bash

DESKTOP_PATH="$HOME/Desktop"
echo "Desktop path: $DESKTOP_PATH" #Debug_purpose: print out desktop path

SCREENSHOT_PATTERN="Screenshot*.png"
echo "Screenshot pattern: $SCREENSHOT_PATTERN"

# Specifying the target directory for screenshots
TARGET_DIR="$HOME/Desktop/Screenshots_demo"

# Ensuring the target directory exists
mkdir -p "$TARGET_DIR"

echo "Scanning for screenshots..."
SCREENSHOTS=$(find "$DESKTOP_PATH" -name "$SCREENSHOT_PATTERN")
echo "Find command output: $SCREENSHOTS"  # Debug: Print output of find

if [ -z "$SCREENSHOTS" ]; then
    echo "No screenshots were found!"
else
    echo "Found the following screenshots:"
    echo "$SCREENSHOTS"

    SCREENSHOT_COUNT=$(echo "$SCREENSHOTS" | wc -l | xargs)
    echo "Total screenshots: $SCREENSHOT_COUNT"
	
    
     # Move each screenshot to the target directory
    echo "Moving screenshots to $TARGET_DIR..."
    while IFS= read -r file; do
        mv "$file" "$TARGET_DIR"
    done <<< "$SCREENSHOTS"

    SCREENSHOT_COUNT=$(echo "$SCREENSHOTS" | wc -l | xargs)
    echo "Total screenshots moved: $SCREENSHOT_COUNT"    


 
fi
