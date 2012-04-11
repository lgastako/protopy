#!/bin/sh

if [ X"$0" = X ]; then
    echo "You must specify exactly one name on the command line."
    exit
fi

name=$0

perl -pi -e "s/.../${name}" setup.py
