#!/bin/sh

trap exit SIGINT

if [ "$1" = "" ]; then
    echo "You must specify exactly one name on the command line."
    exit
fi

PROJECT_NAME="$1"

echo "Autotransmogrifying into: ${PROJECT_NAME}"

. /usr/local/bin/virtualenvwrapper.sh

vi requirements.txt

# TODO: Walk the tree and do this instead?
# At least loop over a list of files.
perl -pi -e "s/{{PROJECT_NAME}}/${PROJECT_NAME}/" setup.py
perl -pi -e "s/{{PROJECT_NAME}}/${PROJECT_NAME}/" scripts/debugserver

mv lib/PROJECT_NAME lib/${PROJECT_NAME}

mate .

# We `` to get the mkvirtualenv stuff out of the bash env
echo mkvirtualenv ${PROJECT_NAME}
mkvirtualenv ${PROJECT_NAME}
easy_install readline

pip install -r requirements.txt

pip install -e .

pip freeze > requirements.txt

rm -rf .git

git init

\rm -rf begin.sh

git add .
git commit -a -m "Initial import."
git co -b getting-started

#open https://github.com/lgastako/${PROJECT_NAME}

