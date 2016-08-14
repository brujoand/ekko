FROM alpine

ENV "PATH=${PATH}:/usr/local/bin"

RUN apk -U add socat jq bash

COPY ./bin/* /usr/local/bin/

EXPOSE 6666

ENTRYPOINT ekko.sh
