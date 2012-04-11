#!/bin/sh

if [ "$1" = "" ]; then
    echo "You must specify exactly one name on the command line."
    exit
fi

PROJECT_NAME="$1"

echo "Autotransmogrifying into: ${PROJECT_NAME}"

. /usr/local/bin/virtualenvwrapper.sh

# We `` to get the mkvirtualenv stuff out of the bash env
mkvirtualenv ${PROJECT_NAME}
easy_install readline
pip install -r requirements.txt

perl -pi -e "s/{{NAME}}/${PROJECT_NAME}/" setup.py

pip install -e .

rm -rf .git

git init

\rm -rf begin.sh

mate .
