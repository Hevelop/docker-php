FROM php:7.4-cli-alpine

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
    oniguruma-dev \
    imagemagick imagemagick-dev \
    tini \
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


ENTRYPOINT ["tini", "--"]

# Run your program under Tini
CMD ["php", "-A"]
RUN apk add --update supervisor && rm  -rf /tmp/* /var/cache/apk/*

ADD supervisord.conf /etc/

CMD ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

RUN apk add --no-cache libsodium libsodium-dev \
        && docker-php-ext-install sodium

