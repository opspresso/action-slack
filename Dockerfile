FROM opspresso/builder:v0.6.5

LABEL "com.github.actions.name"="Post Slack"
LABEL "com.github.actions.description"="Post Message to Slack"
LABEL "com.github.actions.icon"="message-square"
LABEL "com.github.actions.color"="purple"

LABEL version=v0.1.2
LABEL repository="https://github.com/opspresso/action-slack"
LABEL maintainer="Jungyoul Yu <me@nalbam.com>"
LABEL homepage="https://opspresso.com/"

ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
