You should invoke this like

    . ./begin.sh project_name

so that it can set your virtual env up correctly for you.

A complete one-shot install might look like:

    $ git clone git@github.com:lgastako/protopy.git foo && cd foo && . ./begin.sh foo

And in fact you can set up a shell function like so:

    $ function prototype { git clone git@github.com:lgastako/protopy.git $1 && cd $1 && . ./begin.sh $1 }

And then just use it:

    $ prototype foo

And there you be.
