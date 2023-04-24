# Database Service

## Adding new database

If you want to add service that needed a database follow these steps:
- create new script in `scripts/` that will create database and new user for it
- come up with a password for database user and add it to `config.env` and `config.env.template`
- add a database check in `utils/healthcheck.sh` for a newly created database
