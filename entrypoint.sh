#!/bin/sh

set -e

if [ -z "${SLACK_TOKEN}" ]; then
  echo "SLACK_TOKEN is not set."
  exit 1
fi

if [ -z "${JSON_PATH}" ] || [ ! -f "${JSON_PATH}" ]; then
  echo "JSON_PATH is not set."
  exit 1
fi

URL="https://hooks.slack.com/services/${SLACK_TOKEN}"
curl \
    -sSL \
    -X POST \
    -H "Content-type: application/json" \
    --data @"${JSON_PATH}"
