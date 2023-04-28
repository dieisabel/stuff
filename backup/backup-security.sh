#!/usr/bin/env bash

set -e

source ./backup.config

BACKUP_FILE="$BACKUP_DIR/security.tar.gz"

tar zcf "$BACKUP_FILE" -C "$SECURITY_DIR" $(ls "$SECURITY_DIR")
