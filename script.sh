#!/usr/bin/env bash -e

# So that when a command fails the script exists instead of continuing with the
# rest of the script.
set -o errexit

# When nounset is set. It will make the script fail when accessing unset
# variables.
set -o nounset

# When pipefail is set. This will ensure that a pipeline command is trated as
# failed even if one command in the pipeline fails.
set -o pipefail

# For debugging purposes example `TRACE=1 ./script.sh``
if [[ "${TRACE-0}" == "1" ]]; then
    set -o xtrace
fi

COMMANDS_FLAGS="
Help:
    In order to pass arguments use '--' after the command like:
    npm run script-name -- -f

    To enable debug mode set TRACE=1 ex. TRACE=1 ./script.sh
  -h|--help:                    Lists help options
"

# Script arguments
ARGS=""

# Process script flags/arguments
while (( "$#" )); do
  case "$1" in
    -h|--help)
        echo "$COMMANDS_FLAGS"
        exit 0
      ;;
    -*|--*=) # unsupported flags
      echo "Error: Unsupported flag $1" >&2
      exit 1
      ;;
    *) # preserve positional arguments
      ARGS="$ARGS $1"
      shift
      ;;
  esac
done

# set positional arguments in their proper place
eval set -- "$ARGS"

# Change to the scripts directory
cd "$(dirname "$0")"

# Please functions here


# Main body of the script goes here
main() {
    echo "Start your script here."
}

# Call the main function passing in all arguements
main "$@"
