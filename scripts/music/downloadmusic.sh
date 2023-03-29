#!/usr/bin/env bash

set -e -u

LINK="$1"
RETRIES="20"
AUDIO_FORMAT="vorbis"
AUDIO_QUALITY="1"

echo "Audio format: $AUDIO_FORMAT"
echo "Audio quality: $AUDIO_QUALITY"
echo "Amount of retries: $RETRIES"
echo "Link: $LINK"

yt-dlp --extract-audio                   \
       --audio-format  "$AUDIO_FORMAT"   \
       --audio-quality "$AUDIO_QUALITY"  \
       --retries "$RETRIES"              \
       --embed-metadata                  \
       "$LINK"
