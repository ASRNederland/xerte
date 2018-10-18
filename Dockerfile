FROM alpine:3.8 as builder
RUN apk update && apk upgrade && \
    apk add --no-cache git && \
    git clone --quiet https://github.com/thexerteproject/xerteonlinetoolkits.git /thexerteproject && \
    rm -rf /tmp/thexerteproject/.git

FROM php:7.2-apache-stretch
#RUN apt-get update && \
#    apt-get install -y mysql-client && \
#    docker-php-ext-install pdo_mysql
COPY --from=builder /thexerteproject/ /var/www/html/
