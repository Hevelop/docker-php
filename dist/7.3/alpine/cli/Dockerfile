FROM php:7.3-cli-alpine

RUN apk add --no-cache --virtual .build-deps freetype \
    $PHPIZE_DEPS \
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
    imagemagick imagemagick-dev \
    tini \
&& pecl install imagick amqplib \
&& docker-php-ext-enable imagick \
&& docker-php-ext-configure \
    gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
&& docker-php-ext-configure zip --with-libzip \
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
    ;


ENTRYPOINT ["tini", "--"]

# Run your program under Tini
CMD ["php", "-A"]
RUN apk add --no-cache libsodium libsodium-dev \
        && docker-php-ext-install sodium

