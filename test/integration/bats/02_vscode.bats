load '/opt/bats-support/load.bash'
load '/opt/bats-assert/load.bash'

@test "vscode is invocable" {
  run /bin/bash -c "DISPLAY=\"\" dojo -i=false -c Dojofile.to_be_tested \"code --version\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "1.41.1"
  assert_equal "$status" 0
}
@test "vscode extensions are installed" {
  run /bin/bash -c "DISPLAY=\"\" dojo -i=false -c Dojofile.to_be_tested \"code --list-extensions\""
  # this is printed on test failure
  echo "output: $output"
  assert_line --partial "James-Yu.latex-workshop"
  assert_line --partial "streetsidesoftware.code-spell-checker"
  assert_equal "$status" 0
}
