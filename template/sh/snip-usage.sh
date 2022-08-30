#
#/ Usage: {{_name_}} [-h]
#/ {{_cursor_}}Please describe briefly what the program does.
#/
#/ Options:
#/   -h             show this message.
#/
#/ Examples:
#/    $ {{_name_}}
#

usage() {
    grep '^#/' "${0}" | cut -c 3-
    echo ""
    exit 1
}

