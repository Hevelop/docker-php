FROM php:7.1-fpm-stretch
ARG BUILD_PACKAGE="libfreetype6-dev libicu-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libxml2-dev libzip-dev libxslt1-dev imagemagick libpng-dev libmagickwand-dev libmagickcore-dev"

RUN apt-get update \
    && apt-get install --no-install-recommends -y $BUILD_PACKAGE \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
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
    sockets \
    mcrypt \
    && rm -rf /var/lib/apt/lists/*

