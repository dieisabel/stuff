#!/usr/bin/env bash

set -e

source ./backup.config

BACKUP_FILE="$BACKUP_DIR/files.tar.gz"
INCLUDE=(
    'Library'
    'Datasheets'
    'Finances.ods'
    'Resume'
    'Learning'
)

tar zcf "$BACKUP_FILE" -C "$FILES_DIR" ${INCLUDE[*]}
