FROM alpine/git:1.0.4 as builder
RUN git clone https://github.com/thexerteproject/xerteonlinetoolkits.git /tmp/thexerteproject & \
    rm -rf /tmp/thexerteproject/.git

FROM php:7.2-apache-stretch 
COPY --from=builder /tmp/thexerteproject/ /var/www/html/
