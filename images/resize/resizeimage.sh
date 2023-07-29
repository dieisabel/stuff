#!/usr/bin/env bash

# Simple script to resize images. I use it to resize images for my notes

set -e

magick $1 -scale '300x300^' $2
