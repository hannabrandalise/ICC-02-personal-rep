#!/bin/bash

# Create a log file
LOG_FILE="user_activity.log"

# Generate the current date and time using the date command in the format
DATE=$(date +"%Y-%m-%d %H:%M:%S")

# Append the log entry to the file
echo "[$DATE] User: $USER - Log entry: Script executed successfully " >> "$LOG_FILE"