#!/usr/bin/env bash

echo "Checking .changesets for changes since main..."
# npx changeset status --output changeset.json
npx changeset status --since main --output changeset.json

# cat changeset.json && echo ""

cat changeset.json | jq -e ".changesets | length > 0" > /dev/null

if [ $? -eq 0 ]
then
  echo "Changeset files found. Proceeding..."
else
  echo "No changeset files found. Exiting"
  exit 1
fi
