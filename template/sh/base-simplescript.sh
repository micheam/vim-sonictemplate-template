#!/usr/bin/env bash
set -eu
#
#/ {{_input_:func_name}}
#/ {{_input_:what_is_this}}
#/
#/ Simple usage:
#/
#/    {{_input_:func_name}} [--help, -h]
#/
#/ -h,  --help         - This message.
#

# Public: {{_input_:what_is_this}} function.
# Returns nothing.
{{_input_:func_name}}() {

  for arg in "$@"
  do
    case "$arg" in
      -h|--h|--he|--hel|--help|-\?)
        {{_input_:func_name}}Usage
        "$0"
        exit 0
        ;;
    esac
  done

  # do something.
}

# Internal: Displays the usage.  Pulls this from the file that
{{_input_:func_name}}Usage() {
    grep '^#/' "${ORIGINAL_COMMAND_{{_input_:func_name}}}" | cut -c 4-
    echo ""
    set | grep ^VERSION_{{_input_:func_name}}=
}

VERSION_{{_input_:func_name}}="0.0.1"
ORIGINAL_COMMAND_{{_input_:func_name}}="$(cd "${BASH_SOURCE[0]%/*}" || exit 1; pwd)/${BASH_SOURCE[0]##*/}"

# If sourced, load all functions.
# If executed, perform the actions as expected.
if [[ "$0" == "${BASH_SOURCE[0]}" ]] || [[ -z "${BASH_SOURCE[0]}" ]]; then
  {{_input_:func_name}} "$@"
fi
