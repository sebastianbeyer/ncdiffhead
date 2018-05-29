#!/bin/sh

fancydiff() {
    ## check if diff-so-fancy is installed and use it if it is
    if command diff-so-fancy 2>/dev/null; then
        diff-so-fancy
    else
        cat # do nothing
    fi
}

tempfoo=$(basename $0)
TMPFILE1=$(mktemp /tmp/${tempfoo}.XXXXXX) || exit 1
TMPFILE2=$(mktemp /tmp/${tempfoo}.XXXXXX) || exit 1

ncdump -h $1 > $TMPFILE1
ncdump -h $2 > $TMPFILE2

git diff --no-index --color $TMPFILE1 $TMPFILE2 | fancydiff

