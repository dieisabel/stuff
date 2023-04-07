#!/usr/bin/env bash

set -e

pg_isready -U "miniflux"
pg_isready -U "kanboard"
