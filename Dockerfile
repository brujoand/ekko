FROM alpine

RUN apk -U add socat jq

COPY shout.sh /shout.sh
COPY troll.sh /troll.sh
COPY goblin.sh /goblin.sh

EXPOSE 6666

ENTRYPOINT /shout.sh
