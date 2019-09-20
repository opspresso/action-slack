#!/bin/bash

_error() {
  echo -e "$1"

  if [ ! -z "${LOOSE_ERROR}" ]; then
    exit 0
  else
    exit 1
  fi
}

_slack_pre() {
  if [ -z "${SLACK_TOKEN}" ]; then
    _error "SLACK_TOKEN is not set."
  fi

  if [ -z "${JSON_PATH}" ] || [ ! -f "${JSON_PATH}" ]; then
    _error "JSON_PATH is not set."
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
