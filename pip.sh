#!/bin/sh

# if ! is-executable brew -o ! is-executable git; then
#   echo "Skipped: pip (missing: brew and/or git)"
#   exit
# fi

# brew install python

python3 -m pip install --user \
    pep8 \
    pyflakes \
    awslogs

python3 -m pip install --user pipx
python3 -m pipx ensurepath
