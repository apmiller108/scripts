#!/usr/bin/env bash

if [ $# -ne 2 ]; then
  echo "Usage: $0 <directory> <pattern>"
  echo "Example: churn app/models \"*.rb\""
  exit 1
fi

directory=$1
pattern=$2

find "$directory" -name "$pattern" | while read -r file
do
  echo "$file $(git log --format=oneline -- "$file" | wc -l)"
done | sort -k 2 -nr | head
