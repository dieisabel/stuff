# Selfhosted

## Description

For managing selfhosted services I use docker and docker compose plugin. Here is list of services that I use:
- miniflux - lightweight RSS reader
- kanboard - open-source kanban board
- linkding - bookmarks manager
- PostgreSQL database where services store their data

Each service have their separate directory that contain configuration, scripts, dockerfiles and other files that related to service.

## Usage

Pull containers:

```bash
docker compose pull
```

Configure each service using `*.env.template` file. Also check service `README.md`, maybe there are some other actions that needed to setup a service.

Create and start containers:

```bash
docker compose up -d
```
