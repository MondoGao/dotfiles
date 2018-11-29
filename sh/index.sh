#!/usr/bin/env bash
BASEDIR=$(dirname "$0")

for DOTFILE in `find $BASEDIR/ -regex ".*\/[[:digit:]]\{2\}.*" | sort`
do
  [ -f "$DOTFILE" ] && source "$DOTFILE"
done
