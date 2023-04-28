#!/usr/bin/env bash

set -e

if [ "$EUID" -ne 0 ]; then
    echo "Script must be runned as root!"
    exit
fi

source ./backup.config

BACKUP_FILE="$BACKUP_DIR/docker.tar.gz"

tar zcf "$BACKUP_FILE" -C "$DOCKER_DATA_DIR" $(ls "$DOCKER_DATA_DIR")
chown $USERNAME:$USERNAME $BACKUP_FILE
