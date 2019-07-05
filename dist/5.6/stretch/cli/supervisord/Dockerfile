FROM php:5.6-cli-stretch
ARG BUILD_PACKAGE="libfreetype6-dev libicu-dev libjpeg62-turbo-dev libmcrypt-dev libpng-dev libxml2-dev libxslt1-dev"

RUN apt-get update \
    && apt-get install --no-install-recommends -y $BUILD_PACKAGE \
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
    mcrypt \
    && rm -rf /var/lib/apt/lists/*

RUN apt update && apt install --no-install-recommends -y supervisor && rm -rf /var/lib/apt/lists/*

ADD supervisord.conf /etc/

ENTRYPOINT ["supervisord", "--nodaemon", "--configuration", "/etc/supervisord.conf"]

