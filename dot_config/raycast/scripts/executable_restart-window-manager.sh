#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Restart Window Manager
# @raycast.mode inline
#
# Optional parameters:
# @raycast.icon 🤖
# @raycast.packageName Raycast Scripts

yabai --restart-service
skhd --restart-service
