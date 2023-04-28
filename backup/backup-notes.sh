#!/usr/bin/env bash

set -ex

source ./backup.config

BACKUP_FILE="$BACKUP_DIR/notes.tar.gz"

tar zcf "$BACKUP_FILE" -C "$NOTES_DIR" $(find "$NOTES_DIR" -name 'Z*' -printf '%f\n')
