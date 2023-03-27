#!/usr/bin/env bash

set -e

PGPASSWORD="$POSTGRES_PASSWORD"

psql -U 'postgres' \
     -d 'postgres' \
     -c "CREATE USER admin WITH PASSWORD '$ADMIN_PASSWORD' CREATEDB CREATEROLE"
psql -U 'postgres' \
     -d 'postgres' \
     -c "CREATE DATABASE admin OWNER admin"
