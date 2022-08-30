while getopts "h{{_cursor_}}" opt; do
  case $opt in
    h) usage ;;
    ?) usage ;;
  esac
done
