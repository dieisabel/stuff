#!/usr/bin/env bash

set -e

PGPASSWORD="$ADMIN_PASSWORD"
psql -U 'admin' \
     -d 'admin' \
     -c "CREATE USER kanboard WITH PASSWORD '$KANBOARD_USER_PASSWORD'"
psql -U 'admin' \
     -d 'admin' \
     -c "CREATE DATABASE kanboard"
psql -U 'admin' \
     -d 'admin' \
     -c "GRANT ALL ON DATABASE kanboard TO kanboard"
psql -U 'admin' \
     -d 'kanboard' \
     -c "GRANT ALL ON SCHEMA public TO kanboard"
