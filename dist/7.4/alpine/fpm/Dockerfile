FROM php:7.4-fpm-alpine

RUN apk add --no-cache --virtual .build-deps freetype \
    $PHPIZE_DEPS \
    shadow \
    libpng \
    libjpeg-turbo \
    freetype-dev \
    libpng-dev \
    zlib-dev \
    libzip-dev \
    libjpeg-turbo-dev \
    libxml2-dev icu-dev \
    gettext-dev \
    libxslt-dev \
    libmcrypt-dev \
    oniguruma-dev \
    imagemagick imagemagick-dev \
&& pecl install imagick amqplib \
&& docker-php-ext-enable imagick \
&& docker-php-ext-configure \
    gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
&& docker-php-ext-configure zip \
&& docker-php-ext-install \
    dom \
    sockets \
    gd \
    intl \
    mbstring \
    mysqli \
    pdo_mysql \
    xsl \
    zip \
    soap \
    bcmath \
    sockets \
    ;

RUN apk add --no-cache libsodium libsodium-dev \
        && docker-php-ext-install sodium

