#! /usr/bin/env sh

if [ ! -z "$1" ]; then
  REL_PATH="$1"
else
  REL_PATH="$PWD"
fi

find "$REL_PATH"/../files/dotfiles/home | \
  tail -n +2 | \
  xargs perl -MCwd -e 'print Cwd::realpath($ARGV[0]),qq<\n>'
