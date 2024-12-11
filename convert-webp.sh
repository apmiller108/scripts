#!/bin/bash

# Converts images in a directory to webp and resizes them. Places the converted images in a sub dir called "converted". 
# arguments: 1) width 2) base filename and 3) path to images
# Usage: ./convert-webp.sh 800 my-image path/to/dir

# Check if correct number of arguments is provided
if [ "$#" -ne 3 ]; then
  echo "Usage: $0   "
  exit 1
fi

WIDTH=$1
BASE_FILENAME=$2
DIRECTORY=$3

# Check if directory exists
if [ ! -d "$DIRECTORY" ]; then
  echo "Error: Directory '$DIRECTORY' does not exist"
  exit 1
fi

# Create converted directory if it doesn't exist
CONVERTED_DIR="$DIRECTORY/converted"
mkdir -p "$CONVERTED_DIR"

COUNT=0

# Process all jpg, jpeg, and png files
for img in "$DIRECTORY"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do
  [ -f "$img" ] || continue

  NEW_FILENAME="${BASE_FILENAME}_${COUNT}.webp"

  convert "$img" -resize "${WIDTH}x" "$CONVERTED_DIR/$NEW_FILENAME"

  echo "Converted: $img -> $CONVERTED_DIR/$NEW_FILENAME"

  ((COUNT++))
done

if [ $COUNT -eq 0 ]; then
  echo "No images found in directory"
  exit 1
else
  echo "Successfully converted $COUNT images"
fi