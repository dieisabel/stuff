#!/usr/bin/env bash

set -e

PGPASSWORD="$POSTGRES_PASSWORD"

psql -U 'admin' \
     -d 'admin' \
     -c "CREATE USER miniflux WITH PASSWORD '$MINIFLUX_USER_PASSWORD'"
psql -U 'admin' \
     -d 'admin' \
     -c "CREATE DATABASE miniflux"
psql -U 'admin' \
     -d 'admin' \
     -c "GRANT ALL ON DATABASE miniflux TO miniflux"
psql -U 'admin' \
     -d 'miniflux' \
     -c "GRANT ALL ON SCHEMA public TO miniflux"
psql -U 'postgres' \
     -d 'miniflux' \
     -c "CREATE EXTENSION hstore"
