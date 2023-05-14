#!/usr/bin/env bash

# Bash wrapper for script that renames files using their vorbis tags

set -e -u

source ./music.config

$PYTHON $RENAME_PYTHON_SCRIPT
