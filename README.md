# Post Slack

## Usage

```yaml
name: Post Slack

on: push

jobs:
  slack:
    runs-on: ubuntu-latest
    steps:
    - uses: actions/checkout@master
    - uses: opspresso/action-slack@master
      env:
        SLACK_TOKEN: ${{ secrets.SLACK_TOKEN }}
        JSON_PATH: ./target/slack_message.json
```

## env

Name | Description | Default | Required
---- | ----------- | ------- | --------
SLACK_TOKEN | Your Slack WeebHook Token. | | **Yes**
JSON_PATH | The json file path of the slack message. [see](https://api.slack.com/incoming-webhooks) | | **Yes**

## exec

```bash
URL="https://hooks.slack.com/services/${SLACK_TOKEN}"
curl \
    -sSL \
    -X POST \
    -H "Content-type: application/json" \
    --data @"${JSON_PATH}"
```
