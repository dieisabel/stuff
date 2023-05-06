"""Decode markdown links"""

import sys
import os
import pathlib
import json
import logging
import re
from urllib.parse import unquote


def main(args):
    configure_logging()
    config_path = "config.json"
    config = get_config(config_path)
    if not config:
        logging.error(f"cannot load config at {config_path}")
        return 1

    path = config.get("path", None)
    if not path:
        logging.error("config doesn't contain path")
        return 1
    # Convert string path to pathlib.Path for easier use
    path = pathlib.Path(path)

    for filename in os.listdir(str(path)):
        note = read_file(str(path / filename))
        regex = "\[.+\]\((.+)\)"
        links = re.findall(regex, note)
        nonencoded_links = list(map(unquote, links))
        for i in range(len(links)):
            note = re.sub(links[i], nonencoded_links[i], note)
        write_file(str(path / filename), note)
    return 0


def configure_logging():
    logging.basicConfig(level=logging.DEBUG, format="[%(levelname)s]: %(message)s")


def get_config(path):
    if not pathlib.Path(path).is_file():
        return None
    # ! If json is empty when config will be too!
    with open(path, "r") as file:
        config = json.load(file)
    return config


def read_file(path):
    with open(path, "r") as file:
        data = file.read()
    return data


def write_file(path, data):
    with open(path, "w") as file:
        file.write(data)


if __name__ == "__main__":
    sys.exit(main(sys.argv))
