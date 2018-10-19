FROM alpine:3.8 as builder
RUN apk update && apk upgrade && \
    apk add --no-cache git && \
    git clone --quiet https://github.com/thexerteproject/xerteonlinetoolkits.git /thexerteproject && \
    rm -rf /tmp/thexerteproject/.git

FROM php:7-apache
COPY --from=builder /thexerteproject /var/www/html
RUN chown -R www-data:www-data /var/www/html && \
    docker-php-ext-install pdo_mysql && \
    docker-php-ext-install ldap
