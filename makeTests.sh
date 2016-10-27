#!/bin/bash

# Build a bats testing file

# Add bats enviroment
echo "#!/usr/bin/env bats
" > build/tests.bats

# Add each test
TEST_DIR="tests/*"
for f in $TEST_DIR
do
  # Get the name of the file without folder or extension
  name=$(basename $f)
  name=${name%.*}
  name=${name//_/ }

  # Create a test for the file
  echo "@test \"test: $name\" {
    run build/furlang $f
    echo \"\$output\"
    [ \"\$status\" -eq 0 ]

    run lli-3.8 build/ben.ll
    echo \"\$output\"
    [ \"\$status\" -eq 123 ]
  }
  " >> build/tests.bats
done