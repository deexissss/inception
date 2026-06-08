FROM alpine:3.22

RUN apk update && apk add --no-cache \
    php83 \
    php83-fpm \
    php83-mysqli \
    php83-curl \
    php83-dom \
    php83-exif \
    php83-fileinfo \
    php83-mbstring \
    php83-openssl \
    php83-xml \
    php83-zip \
    php83-phar \
    php83-tokenizer \
    php83-session \
    php83-ctype \
    php83-simplexml \
    php83-iconv \
    mariadb-client \
    curl \
    bash

RUN adduser -S -G www-data www-data

RUN mkdir -p /run/php /var/www/html \
 && chown -R www-data:www-data /run/php /var/www/html

RUN curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
 && chmod +x /usr/local/bin/wp

COPY conf/www.conf /etc/php83/php-fpm.d/www.conf
COPY tools/wordpress.sh /usr/local/bin/wordpress.sh

RUN chmod +x /usr/local/bin/wordpress.sh

ENTRYPOINT ["/usr/local/bin/wordpress.sh"]

