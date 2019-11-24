FROM alpine:3.10

RUN apk add --no-cache bash gawk sed grep bc coreutils curl

COPY entrypoint.sh /usr/bin/entrypoint.sh
ENTRYPOINT ['/usr/bin/entrypoint.sh']