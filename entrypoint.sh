#!/bin/sh

set -e

_slack_pre() {
  if [ -z "${SLACK_TOKEN}" ]; then
    echo "SLACK_TOKEN is not set."
    exit 1
  fi

  if [ -z "${JSON_PATH}" ] || [ ! -f "${JSON_PATH}" ]; then
    echo "JSON_PATH is not set."
    exit 1
  fi
}

_slack() {
  _slack_pre

  URL="https://hooks.slack.com/services/${SLACK_TOKEN}"
  curl \
      -sSL \
      -X POST \
      -H "Content-type: application/json" \
      --data @"${JSON_PATH}" \
      ${URL}
}

_slack
