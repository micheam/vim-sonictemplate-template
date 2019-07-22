#!/usr/bin/env bats

load {{_cursor_}}

setup() {
  WORKDIR=$(mktemp -d)
}

teardown() {
  [[ -d "${WORKDIR}" ]] && rm -rf "${WORKDIR}"
}

@test "some test" {
  # setup
  # exercise
  run $(echo "hello")
  #verify
  [ $status -eq 1 ]
  [ $(expr "${lines[0]}" : "test") -ne 0 ]
}
