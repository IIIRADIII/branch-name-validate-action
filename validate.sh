#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Illegal number of parameters. The script accepts single argument which is branch name to validate"
  exit 1
fi


branch_name=$1
branch_name_patterns=("^master$" "^staging$" "^develop$" "^feature/.*" "^hotfix/.*" "^bugfix/*" "^service/*" "^validated/*")

is_branch_name_valid=false
for branch_pattern in "${branch_name_patterns[@]}"
do
  if [[ $branch_name =~ $branch_pattern ]]; then
    echo "Branch name '$branch_name' is valid"
    exit 0
  fi
done
echo "Branch name '$branch_name' is not valid"
echo "Name of the branch should match one of the following regex patterns:"
for branch_pattern in "${branch_name_patterns[@]}"; do echo "   $branch_pattern"; done
exit 1
