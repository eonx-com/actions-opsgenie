FROM alpine:3.10

RUN apk add --no-cache bash curl

COPY entrypoint.sh /bin
ENTRYPOINT ["/bin/entrypoint.sh"]