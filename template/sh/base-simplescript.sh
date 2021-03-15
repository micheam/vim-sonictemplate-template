#!/usr/bin/env bash
set -e

PROFILE=default

#
#/ Usage: {{_input_:script name}} [--help] ARGS
#/ {{_cursor_}}
#/
#/ Options:
#/   --help             show this message.
#/
#/ Examples:
#/    $ {{_input__:script name}} --helph 
#

usage() {
    grep '^#/' "${0}" | cut -c 3-
    echo ""
}

_main() {
  printf "[%s] Hello, %s" $PROFILE ${1:?NAMEを指定してください}
}

while [ -n "$(echo ${1:?引数が必要です} | grep -e '^-')" ]; do
  case "$1" in
    -h,--help)
      usage
      exit 0
      ;;
    --profile)
      PROFILE=$2
      shift ;;
  esac
done

if [ $# == 0 ]; then
  usage
  exit 1
fi

_main ${1}

