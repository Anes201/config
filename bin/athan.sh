#!/bin/bash

# Check if jq is installed
if ! command -v jq >/dev/null; then
 echo "Error: 'jq' is not installed. Install it using: sudo apt install jq"
 exit 1
fi

# Assign variables
LATITUDE=36.76639  # Example latitude (Algiers)
LONGITUDE=3.47717  # Example longitude (Algiers)
METHOD=19 # Default to method 2 (ISNA) if not provided

# Get today's date
TODAY=$(date +%Y-%m-%d)

# API URL
API_URL="https://api.aladhan.com/v1/timings/$TODAY?latitude=$LATITUDE&longitude=$LONGITUDE&method=$METHOD"

response=$(curl -s "$API_URL")

# Check if response is empty
if [ -z "$response" ]; then
 echo "Error: No response from API!"
 exit 1
fi

# Parse and display prayer times
echo "Islamic Prayer Times:"
echo "----------------------"
echo "Date: $(echo "$response" | jq -r '.data.date.readable')"
echo "Hijri Date: $(echo "$response" | jq -r '.data.date.hijri.date')"

echo ""
echo "Prayer Times:"
echo "Fajr     : $(echo "$response" | jq -r '.data.timings.Fajr')"
echo "Sunrise : $(echo "$response" | jq -r '.data.timings.Sunrise')"
echo "Dhuhr    : $(echo "$response" | jq -r '.data.timings.Dhuhr')"
echo "Asr      : $(echo "$response" | jq -r '.data.timings.Asr')"
echo "Maghrib : $(echo "$response" | jq -r '.data.timings.Maghrib')"
echo "Isha     : $(echo "$response" | jq -r '.data.timings.Isha')"
