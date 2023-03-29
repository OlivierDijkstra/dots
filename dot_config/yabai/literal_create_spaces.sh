#!/bin/sh
# This is a shell script for managing spaces on macOS using the yabai window manager.
# It ensures that each display has a desired number of spaces by creating or destroying spaces as needed.

# Set the desired number of spaces per display.
DESIRED_SPACES_PER_DISPLAY=4

# Query the current number of spaces on each display using yabai and store the results.
CURRENT_SPACES="$(yabai -m query --displays | jq -r '.[].spaces | @sh')"

# Initialize a counter for the difference between the desired and current number of spaces.
DELTA=0

# Loop through the list of current spaces.
while read -r line
do
  # Get the last space number from the line and increment it by DELTA.
  LAST_SPACE="$(echo "${line##* }")"
  LAST_SPACE=$(($LAST_SPACE+$DELTA))

  # Count the number of existing spaces.
  EXISTING_SPACE_COUNT="$(echo "$line" | wc -w)"
  
  # Calculate the number of missing spaces.
  MISSING_SPACES=$(($DESIRED_SPACES_PER_DISPLAY - $EXISTING_SPACE_COUNT))
  
  # If there are missing spaces, create them.
  if [ "$MISSING_SPACES" -gt 0 ]; then
    for i in $(seq 1 $MISSING_SPACES)
    do
      yabai -m space --create "$LAST_SPACE"
      LAST_SPACE=$(($LAST_SPACE+1))
    done
  # If there are extra spaces, destroy them.
  elif [ "$MISSING_SPACES" -lt 0 ]; then
    for i in $(seq 1 $((-$MISSING_SPACES)))
    do
      yabai -m space --destroy "$LAST_SPACE"
      LAST_SPACE=$(($LAST_SPACE-1))
    done
  fi

  # Update the DELTA counter with the number of missing spaces.
  DELTA=$(($DELTA+$MISSING_SPACES))
done <<< "$CURRENT_SPACES"
