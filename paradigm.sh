#!/bin/bash

: ' paradigm.sh

This script is an example template for writing quality, reusable bash scripts.

See the examples at the bottom of the script for usage.
'

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

  # Stored variables are available to any functions called by this function

  # Temporary variables can be passed inline to called functions.
}

: '
This is where the magic is:
Running `"$@"` will execute the command passed to this script as a bash command
If there is an error parsing the command, the `help` function will be called
and the script will exit with code 1
'

"$@" || (help && exit 1)

: '
Other benefits:
- Functions can be called directly from the CLI
- Script does not have to be installed beforehand
- Leaves no trace in your source

Warning:
This script will execute any command passed to it as a bash command. Hic sunt dracones.

Examples:
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
