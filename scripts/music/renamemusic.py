import os
import logging
import sys
import re

from mutagen.oggvorbis import OggVorbis

logging.basicConfig(level=logging.DEBUG, format="[%(levelname)s]: %(message)s")


def main(args):
    for file in os.listdir():
        name, extension = os.path.splitext(file)
        if extension == ".ogg":
            logging.debug(f"{file}: found")
            rename(file)
        else:
            logging.debug(f"skipping {file}")
    return 0


def rename(file):
    song = OggVorbis(file)
    needed_tags = ["title", "discnumber", "tracknumber"]
    tags_data = {}
    for tag, value in song.tags:
        if tag.lower() in needed_tags:
            tags_data[tag.lower()] = value
    for tag in needed_tags:
        if tag not in tags_data:
            logging.debug(f"{file}: doesn't contain needed tags, skipping")
            return
    # Often MusicBrainz adds artist name to title, but I don't like it
    regex = re.compile(" - ")
    # Get a title name wihout artist, remove (feat. ...) if exists and when strip
    title = regex.split(tags_data["title"])[-1].split("(")[0].strip()
    new_filename = "{discnumber}-{tracknumber} {title}.ogg".format(
        discnumber=tags_data["discnumber"],
        tracknumber=tags_data["tracknumber"].zfill(2),
        title=title,
    )
    os.rename(file, new_filename)
    logging.debug(f"{file}: renamed from {file} to {new_filename}")


if __name__ == "__main__":
    sys.exit(main(sys.argv))
