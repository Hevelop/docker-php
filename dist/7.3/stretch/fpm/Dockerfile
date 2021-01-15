FROM php:7.3-fpm-stretch
ARG BUILD_PACKAGE="libfreetype6-dev libicu-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libxml2-dev libzip-dev libxslt1-dev imagemagick libpng-dev libmagickwand-dev libmagickcore-dev"

RUN apt-get update \
    && apt-get install --no-install-recommends -y $BUILD_PACKAGE \
    && pecl install imagick amqplib \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install \
    dom \
    sockets \
    gd \
    intl \
    mbstring \
    pdo_mysql \
    xsl \
    zip \
    soap \
    bcmath \
     \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
        && apt-get install -y apt-transport-https \
        && curl https://packages.sury.org/php/apt.gpg -o /etc/apt/trusted.gpg.d/php.gpg \
        && echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list \
        && rm -rf /var/lib/apt/lists/* && apt-get update \
        && apt-get install --yes libsodium-dev \
        && docker-php-ext-install sodium

