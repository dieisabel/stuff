#!/usr/bin/env bash

set -e

source ./backup.config

BACKUP_FILE="$BACKUP_DIR/notes.tar.gz"
INCLUDE=(
    'Zettles'
    'Zettelkasten'
)

tar zcf "$BACKUP_FILE" -C "$NOTES_DIR" ${INCLUDE[*]}
