#!/usr/bin/env bash
# __YouTube Downloader__ #
# Author: <anes>
# Version: 2.2 (Improved)
# Requirements: "yt-dlp"
# Usage: ytd <URL>

# Function to display usage instructions
usage() {
    printf "Usage: ytd <URL>\n"
    printf "Options:\n"
    printf "  - Single Video or Playlist (s/p)\n"
    printf "  - Video or Audio (v/a)\n"
    exit 1
}

# Function to download single video or audio
download_single() {
    local url=$1
    local format=$2
    local output_dir="$HOME/Downloads/Videos"

    # Ensure output directory exists
    mkdir -p "$output_dir"

    if [[ $format == 'a' ]]; then
        printf "Downloading Single Audio (mp3)...\n"
        yt-dlp -f 'ba' -x --audio-format mp3 "$url" -o "$output_dir/%(title)s.%(ext)s" || { printf "Error: Failed to download audio.\n"; exit 1; }
        printf "Success! Audio (mp3) Downloaded!\n"
    elif [[ $format == 'v' ]]; then
        printf "Downloading Single Video (mp4)...\n"
        yt-dlp -f 'bv[height=480][ext=mp4]+ba[ext=m4a]' --embed-subs "$url" -o "$output_dir/%(title)s.%(ext)s" || { printf "Error: Failed to download video.\n"; exit 1; }
        printf "Success! Video (mp4) Downloaded!\n"
    else
        printf "Downloading Best Available Single Video...\n"
        yt-dlp -f 22 --embed-subs "$url" -o "$output_dir/%(title)s.%(ext)s" || { printf "Error: Failed to download video.\n"; exit 1; }
        printf "Success! Video Downloaded!\n"
    fi
}

# Function to download playlist
download_playlist() {
    local url=$1
    local format=$2
    local output_dir="$HOME/Downloads/Videos"

    # Ensure output directory exists
    mkdir -p "$output_dir"

    if [[ $format == 'a' ]]; then
        printf "Downloading Audio Playlist (mp3)...\n"
        yt-dlp -f 'ba' -x --audio-format mp3 --download-archive "$output_dir/videos.txt" "$url" -o "$output_dir/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" || { printf "Error: Failed to download audio playlist.\n"; exit 1; }
        printf "Success! Audio Playlist (mp3) Downloaded!\n"
    elif [[ $format == 'v' ]]; then
        printf "Downloading Video Playlist (mp4)...\n"
        yt-dlp -f 'bv*[height=360][ext=mp4]+ba[ext=m4a]' --download-archive "$output_dir/videos.txt" --embed-subs "$url" -o "$output_dir/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" || { printf "Error: Failed to download video playlist.\n"; exit 1; }
        printf "Success! Video Playlist (mp4) Downloaded!\n"
    else
        printf "Downloading Best Available Playlist...\n"
        yt-dlp -f 22 --embed-subs "$url" -o "$output_dir/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s" || { printf "Error: Failed to download playlist.\n"; exit 1; }
        printf "Success! Playlist Downloaded!\n"
    fi
}

# Main script logic
if [[ $# -eq 0 ]]; then
    printf "Error: No URL provided.\n"
    usage
fi

printf "Single Video or Playlist (s/p)? "
read -r media_type
printf "Video or Audio (v/a)? "
read -r format

case $media_type in
    s|S)
        download_single "$1" "$format"
        ;;
    p|P)
        download_playlist "$1" "$format"
        ;;
    *)
        printf "Invalid input. Please enter 's' for single video or 'p' for playlist.\n"
        exit 1
        ;;
esac
