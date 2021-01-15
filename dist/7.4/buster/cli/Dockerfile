FROM php:7.4-cli-buster
ARG BUILD_PACKAGE="libfreetype6-dev libicu-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libxml2-dev libzip-dev libxslt1-dev imagemagick libpng-dev libmagickwand-dev libmagickcore-dev"

RUN apt-get update \
    && apt-get install --no-install-recommends -y $BUILD_PACKAGE \
    && pecl install imagick amqplib \
    && docker-php-ext-enable imagick \
    && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
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
     \
    && rm -rf /var/lib/apt/lists/*

ENV TINI_VERSION v0.18.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini
ENTRYPOINT ["/tini", "--", "docker-php-entrypoint"]

# Run your program under Tini
CMD ["php", "-A"]
RUN apt-get update \
        && apt-get install -y apt-transport-https \
        && curl https://packages.sury.org/php/apt.gpg -o /etc/apt/trusted.gpg.d/php.gpg \
        && echo "deb https://packages.sury.org/php/ stretch main" > /etc/apt/sources.list.d/php.list \
        && rm -rf /var/lib/apt/lists/* && apt-get update \
        && apt-get install --yes libsodium-dev \
        && docker-php-ext-install sodium

