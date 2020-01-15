FROM alpine:3.7

MAINTAINER Cloud Posse, LLC

RUN apk update && apk add gcc ca-certificates openssl musl-dev git fuse syslog-ng coreutils curl

ENV GOOFYS_VERSION 0.23.1
RUN curl --fail -sSL -o /usr/local/bin/goofys https://github.com/kahing/goofys/releases/download/v${GOOFYS_VERSION}/goofys \
    && chmod +x /usr/local/bin/goofys

ENV MOUNT_DIR /mnt/s3
ENV REGION us-east-1
ENV ENDPOINT https://s3.amazonaws.com
ENV BUCKET teleport-bucket
ENV STAT_CACHE_TTL 1m0s
ENV TYPE_CACHE_TTL 1m0s
ENV DIR_MODE 0700
ENV FILE_MODE 0600

RUN mkdir /mnt/s3

VOLUME /mnt/s3

ADD rootfs/ /

RUN chmod +x /usr/bin/run.sh

ENTRYPOINT ["sh"]
CMD ["/usr/bin/run.sh"]
