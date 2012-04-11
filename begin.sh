#!/bin/sh

if [ "$1" = "" ]; then
    echo "You must specify exactly one name on the command line."
    exit
fi

PROJECT_NAME="$1"

echo "Autotransmogrifying into: ${PROJECT_NAME}"

. /usr/local/bin/virtualenvwrapper.sh

# We `` to get the mkvirtualenv stuff out of the bash env
echo mkvirtualenv ${PROJECT_NAME}
mkvirtualenv ${PROJECT_NAME}
easy_install readline

vi requirements.txt
pip install -r requirements.txt

perl -pi -e "s/{{PROJECT_NAME}}/${PROJECT_NAME}/" setup.py

pip install -e .

pip freeze > requirements.txt

rm -rf .git

git init

\rm -rf begin.sh

git add .
git commit -a -m "Initial import."
git co -b getting-started

mate .

open https://github.com/lgastako/${PROJECT_NAME}

