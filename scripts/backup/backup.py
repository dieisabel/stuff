import sys
import logging
import os
import pathlib
import subprocess

logging.basicConfig(level=logging.DEBUG, format="[%(levelname)s]: %(message)s")

RSYNC_OPTIONS = [
    "-a",
    "--verbose",
    "--recursive",
    "--delete",
]
DOCUMENTS_DIR = pathlib.Path(os.environ.get("HOME")) / "documents"
DOCUMENTS_EXCLUDES = [
    "attachments",
    "trash",
    "notes.sqlite",
]
FILES_DIR = pathlib.Path(os.environ.get("HOME")) / "files"
BACKUP_DIR = pathlib.Path("/media/kostiantyn/A3F6-5E12")


def main(args):
    sync_documents()
    sync_files()
    return 0


def sync_documents():
    options = RSYNC_OPTIONS.copy()
    for exclude in DOCUMENTS_EXCLUDES:
        options.append(f"--exclude={exclude}")
    rsync(DOCUMENTS_DIR, BACKUP_DIR, options)


def sync_files():
    rsync(FILES_DIR, BACKUP_DIR, RSYNC_OPTIONS)


def rsync(source, destination, options):
    logging.info(f"rsync: syncing {str(source)} folder to {str(destination)}")
    return subprocess.call(["rsync", *options, str(source), str(destination)])


if __name__ == "__main__":
    sys.exit(main(sys.argv))
