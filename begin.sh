#!/bin/sh

if [ "$1" = "" ]; then
    echo "You must specify exactly one name on the command line."
    exit
fi

PROJECT_NAME="$1"

perl -pi -e "s/{{NAME}}/${PROJECT_NAME}/" setup.py
