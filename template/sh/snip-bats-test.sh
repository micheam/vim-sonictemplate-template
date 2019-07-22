@test "{{_input_:disctiption}}" {
  # setup
  # exercise
  run $(echo "hello")
  #verify
  [ $status -eq 1 ]
  [ $(expr "${lines[0]}" : "test") -ne 0 ]
}

