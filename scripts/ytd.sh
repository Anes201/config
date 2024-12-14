#!/usr/bin/env bash

# __YouTube Downloader__ #

# Author: <anes>
# Version: 2.1
# requirements: "yt-dlp"
# Usage: ytd <URL>

# Function to download single video or audio
download_single() {
    local url=$1
    local format=$2

    if [[ $format == 'a' ]]; then
        printf "Downloading Single Audio (mp3)...\n"
        yt-dlp -f 'ba' -x --audio-format mp3 "$url" -o "$HOME/Downloads/Videos/%(title)s.%(ext)s"
        printf "Success! Audio (mp3) Downloaded!\n"
    elif [[ $format == 'v' ]]; then
        printf "Downloading Single Video (mp4)...\n"
        yt-dlp -f 'bv[height=480][ext=mp4]+ba[ext=m4a]' --embed-subs "$url" -o "$HOME/Downloads/Videos/%(title)s.%(ext)s"
        printf "Success! Video (mp4) Downloaded!\n"
    else
        printf "Downloading Normal Single Video (best)\n"
        yt-dlp -f 22 --embed-subs "$url" -o "$HOME/Downloads/Videos/%(title)s.%(ext)s"
        printf "Success! Video Downloaded\n"
    fi
}

# Function to download playlist
download_playlist() {
    local url=$1
    local format=$2

    if [[ $format == 'a' ]]; then
        printf "Downloading Audio Playlist (mp3)...\n"
        yt-dlp -f 'ba' -x --audio-format mp3 --download-archive videos.txt "$url" -o '$HOME/Downloads/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
        printf "Success! Audio Playlist (mp3) Downloaded!\n"
    elif [[ $format == 'v' ]]; then
        printf "Downloading Video Playlist (mp4)...\n"
        yt-dlp -f 'bv*[height=360][ext=mp4]+ba[ext=m4a]' --download-archive videos.txt --embed-subs "$url" -o '$HOME/Downloads/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'
        printf "Success! Video Playlist (mp4) Downloaded!\n"
    else
        printf "Downloading Normal Playlist (available)\n"
        yt-dlp -f 22 --embed-subs "$url" -o "$HOME/Downloads/Videos/%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s"
        printf "Success! playlist Downloaded\n"
    fi
}

# Main script
printf "Single Video or Playlist (s/p)?: "
read media_type
printf "Video Or Audio (v/a/f)?: "
read format

if [[ $media_type == "p" ]]; then
    download_playlist "$1" "$format"
elif [[ $media_type == 's' ]]; then
    download_single "$1" "$format"
else
    printf "Invalid input. Please enter 's' for single video or 'p' for playlist.\n"
    exit 1
fi
