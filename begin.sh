#!/bin/sh

if [ "$*" = "" ]; then
    echo "You must specify exactly one name on the command line."
    exit
fi

name=$0

perl -pi -e "s/{{NAME}}/$name" setup.py
