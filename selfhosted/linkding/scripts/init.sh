#!/usr/bin/env bash

set -e

docker exec -it selfhosted-linkding-1 python manage.py createsuperuser --username=admin --email=admin@admin.com
