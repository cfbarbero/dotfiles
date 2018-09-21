#!/bin/sh

# if ! is-executable brew -o ! is-executable git; then
#   echo "Skipped: pip (missing: brew and/or git)"
#   exit
# fi

# brew install python

pip install \
    pep8 \
    pyflakes \
    awslogs