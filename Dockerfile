FROM alpine

ENV "PATH=${PATH}:/usr/local/bin"

RUN apk -U add socat jq bash

COPY ekko /usr/local/bin/ekko

EXPOSE 6666

CMD [ "listen" ]

ENTRYPOINT [ "ekko" ]
