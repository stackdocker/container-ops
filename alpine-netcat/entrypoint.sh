#!/bin/sh
set -e

while true; do nc -l 80 < index.html; done
