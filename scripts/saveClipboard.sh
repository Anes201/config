#!/bin/bash
# apt install xsel
# Get the current clipboard content
clipboard_content=$(xsel -o)
clipboard_file="~/.clipboard"
# Append the content to the clipboard.txt file in the home directory
echo "$clipboard_content" >> $clipboard_file
# Optionally, you can add a newline after each entry
echo "" >> $clipboard_file

