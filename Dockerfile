FROM python:3.7-stretch

LABEL "com.github.actions.name"="Post Slack"
LABEL "com.github.actions.description"="Post Message to Slack"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="purple"

LABEL version=v0.0.2
LABEL repository="https://github.com/opspresso/action-slack"
LABEL maintainer="Jungyoul Yu <me@nalbam.com>"
LABEL homepage="https://opspresso.com/"

RUN apt-get update && \
    apt-get install -y --no-install-recommends curl && \
    apt-get -y clean && apt-get -y autoclean && apt-get -y autoremove

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
