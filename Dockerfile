FROM alpine:3.8 as builder
RUN apk update && apk upgrade && \
    apk add --no-cache git && \
    git clone --quiet https://github.com/thexerteproject/xerteonlinetoolkits.git /thexerteproject && \
    rm -rf /tmp/thexerteproject/.git

FROM php:7-apache
COPY --from=builder /thexerteproject /var/www/html
RUN chown -R www-data:www-data /var/www/html && \
    docker-php-ext-install pdo_mysql && \
    apt-get update -yqq && \
    apt-get install -y libldap2-dev && \
    docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ && \
    docker-php-ext-install ldap \
