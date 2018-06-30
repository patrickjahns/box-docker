FROM php:7.1-cli-alpine
ARG BOX_URL
RUN wget $BOX_URL -O /usr/local/bin/box && \
    chmod +x /usr/local/bin/box && \
    apk update && apk upgrade && \
    apk add --no-cache bash git openssh

COPY entrypoint /usr/local/bin/

ENTRYPOINT ["entrypoint"]

WORKDIR /workspace