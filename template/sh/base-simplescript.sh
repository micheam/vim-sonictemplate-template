#!/usr/bin/env bash
set -e

#
#/ Usage: {{_input_:script name}} [-h] [-p PROFILE] ARGS
#/ 
#/
#/ Options:
#/   -p PROFILE     set PROFILE name.
#/   -h             show this message.
#/
#/ Examples:
#/    $ {{_input_:script name}} -h
#/    $ {{_input_:script name}} $(hostname)
#/    $ {{_input_:script name}} -p DEBUG $(hostname)
#

usage() {
    grep '^#/' "${0}" | cut -c 3-
    echo ""
    exit 1
}

PROFILE=
NAME=

_main() {
  if [ -n "$PROFILE" ]; then
    echo -n "[${PROFILE}] "
  fi
  echo Hello, $@
}

while getopts "hp:" opt; do
  case $opt in
    h) usage ;;
    p) PROFILE="$OPTARG" ;;
    ?) usage ;;
  esac
done

shift $((OPTIND -1))

# # need args?
# if [ $# == 0 ]; then
#   usage
# fi

_main $@
