#! /bin/bash

BRANCH="$(git rev-parse --abbrev-ref HEAD)"
if [[ "$BRANCH" != "master" ]]; then
  echo 'Deploy script will only run in master branch.';
  exit 1;
fi

echo 'Deploying to Pub...';
dart format .
flutter pub publish
