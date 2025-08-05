#!/bin/bash

# This script iterates through all subdirectories in the current directory,
# finds a file named 'neovim.lua' inside a theme subdirectory,
# and copies it to a specified destination.

# Check if a destination path is provided as an argument
# if [ -z "$1" ]; then
#     echo "Error: Please provide the destination path as the first argument."
#     exit 1
# fi

# Set the destination path from the first argument
DESTINATION_PATH="/home/charlie/.local/share/omarchy/themes"

# Create the destination directory if it doesn't exist
mkdir -p "$DESTINATION_PATH"

# Loop through all subdirectories in the current directory
for theme_dir in */; do
    # Remove the trailing slash from the directory name
    theme_name=$(basename "$theme_dir")

    # Define the source file path
    SOURCE_FILE="./$theme_name/neovim.lua"

    # Check if the 'neovim.lua' file exists in the subdirectory
    if [ -f "$SOURCE_FILE" ]; then
        # Define the destination file path
        DESTINATION_FILE="$DESTINATION_PATH/$theme_name/neovim.lua"

        # Create the theme's subdirectory in the destination if it doesn't exist
        mkdir -p "$DESTINATION_PATH/$theme_name"

        # Copy the file, overwriting the destination if it exists
        cp -f "$SOURCE_FILE" "$DESTINATION_FILE"

        echo "Copied '$SOURCE_FILE' to '$DESTINATION_FILE'."
    fi
done

echo "Script finished."
