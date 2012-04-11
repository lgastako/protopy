Protopy
=======

Introduction
------------

Protopy exists because I like to start and discard a lot of spike solutions,
etc but I want my whole toolchain there every time.  I really want a more
complete solution but I keep putting off doing anything until I have time
to make it perfect and all-inclusive.  In an effort to combat that problem
I'm just putting this on github right now.  It's already saved me a lot of
time in the last 24 hrs, so even if it never evolves to an epic standalone
project templating system that can be everything to everyone all the time
well at least it's a start.

Currently the vast majority of these projects are in python and the vast
majority of those are web oriented so the defaults tend to run in that
direction.

I really only created this for me, but I made it a public repo in case it's
helpful to anyone else (and to save on private repos) and threw in an MIT
license just in case.


What does it do?
----------------

This will certainly change over time and I don't necessarily plan to keep this
section of the documentation 100% up to date with every little detail, but it
should give you a basic idea... and I probably will update it with major
things.

Anyway, currently it runs through approximately these steps:

1. Create a virtual environment with $PROJECT_NAME.
1. Installs readline (via easy_install instead of pip, to avoid
   known problems).
1. Opens the default requirements.txt in vi so that you can edit it
   to add/remove whatever you desire.
1. Installs all requirements from requirements.txt (using pip -r).
1. Replaces {{PROJEC_NAME}} with $PROJECT_NAME in setup.py.
1. Installs the current application for development (via pip).
1. Freezes the currently installed requirements to requirements.txt.
1. Removes the .git directory from the initial protopy checkout.
1. Initializes a new git repository.
1. Removes itself (the begin.sh setup script).
1. Adds everything to the new git repository.
1. Commits it with a commit message of "Initial import."
1. Creats a new branch from master called "getting-started."
1. Opens textmate in the currently directory (project style).
1. Open the github page for the project (which doesn't exist yet).


Usage
-----

You should invoke this like

    . ./begin.sh project_name

so that it can set your virtual env up correctly for you.

A complete one-shot install might look like:

    $ git clone git@github.com:lgastako/protopy.git foo && cd foo && . ./begin.sh foo

And in fact you can set up a shell function like so (drop it in your .bashrc or whatever floats your boat to make it persistent):

    $ function protopy { git clone git@github.com:lgastako/protopy.git $1 && cd $1 && . ./begin.sh $1 }

(Presumably you would fork this and use your own github URL here unless you
happen to want exactly my environment).

And then just use it:

    $ protopy foo

And there you be.
