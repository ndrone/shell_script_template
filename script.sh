#!/usr/bin/env bash

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

if [[ "${1-}" =~ ^-*h(elp)?$ ]]; then
    echo 'Usage: ./script.sh arg-one arg-two

This is an awesome bash script to make your life better.

'
    exit
fi

# Change to the scripts directory
cd "$(dirname "$0")"

# Please functions here


# Main body of the script goes here
main() {
    echo "Hello World!"
}

# Call the main function passing in all arguements
main "$@"
