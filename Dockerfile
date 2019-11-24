FROM alpine:3.10

RUN apk add --no-cache bash gawk sed grep bc coreutils curl

COPY entrypoint.sh /usr/local/bin/
ENTRYPOINT ['/usr/local/bin/entrypoint.sh']