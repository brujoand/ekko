FROM alpine

RUN apk -U add socat

COPY ekko.sh /ekko.sh
COPY troll.sh /troll.sh
COPY tusse.sh /tusse.sh

EXPOSE 6666

ENTRYPOINT /ekko.sh
