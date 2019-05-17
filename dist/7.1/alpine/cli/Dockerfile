FROM php:7.1-cli-alpine

RUN apk add --no-cache --virtual .build-deps freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev libxml2-dev icu-dev gettext-dev libxslt-dev libmcrypt-dev && \
    docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-install \
    dom \
    gd \
    intl \
    mbstring \
    pdo_mysql \
    xsl \
    zip \
    soap \
    bcmath \
    mcrypt
