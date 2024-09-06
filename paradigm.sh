#!/bin/bash

help() {
  # This will get called if there is an error
  echo $0 [function] [args]
  echo "How to use this script"
}

foo() {
  # Inputs: $1, $2, ... "$@"
  # Output: whatever is echoed to STDOUT
  echo $1
}

bar() {
  # Call a function in this script and store the output in a variable
  BAR=$(foo bar)
  echo bar: $BAR
}

# This is where the magic is:
# Running `"$@"` will execute the command passed to this script as a bash command
# If there is an error parsing the command, the `help` function will be called
# and the script will exit with code 1

"$@" || (help && exit 1)

: '
Example usage:
./script foo bar
  -> bar

./script bar
  -> bar: bar

./script help
  -> help message
  -> (exit code 0)

./script helppp
  -> helppp: command not found
  -> help message
  -> (exit code 1)
'
