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

@test "latex to pdf works" {
  # create the pdf file
  run /bin/bash -c "DISPLAY=\"\" dojo -i=false -c Dojofile.to_be_tested \"rm -f main.pdf && pdflatex -interaction=nonstopmode -file-line-error main.tex\""
  assert_equal "$status" 0

  # test that the pdf file exists
  run /bin/bash -c "DISPLAY=\"\" dojo -i=false -c Dojofile.to_be_tested \"stat main.pdf\""
  assert_equal "$status" 0
}
