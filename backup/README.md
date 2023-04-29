# Backup

To backup data I use tar archives.

## Configuration

To configure paths use `backup.config.template`, make sure you use absolute paths. Archives will be placed in `BACKUP_DIR`.

## Notes

All my notes are located in `$HOME/documents/Zettles` and `$HOME/documents/Zettelkasten`. To backup use `backup-notes.sh`.

## Docker

I use selfhosted services using docker, some of them have data volumes that I need to backup. To backup use `backup-docker.sh`,
make sure you run it as root.

## Security files

I use some security tools like Aegis for 2FA and KeePassXC for passwords, to backup them use `backup-security.sh`.

## Files

Also I want to backup my library, datasheets, stuff related to work etc, I keep separate archive for that. To backup use `backup-files.sh`.
