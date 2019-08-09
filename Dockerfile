FROM composer:latest AS composer

FROM debian:stretch-slim

LABEL maintainer="dnnsrmp@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    bzip2

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - \

    && wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list' \

    && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \

    && apt-get update \
    && apt-get install -y --no-install-recommends --autoremove \
        php7.0-apcu \
        php7.0-bcmath \
        php7.0-common \
        php7.0-readline \
        php7.0-fpm \
        php7.0-gd \
        php7.0-cli \
        php7.0-mysql \
        php7.0-sqlite \
        php7.0-curl \
        php7.0-intl \
        php7.0-mbstring \
        php7.0-opcache \
        php7.0-json \
        php7.0-pdo \
        php7.0-memcached \
        php7.0-zip \
        php7.0-xsl \
        php7.0-gmagick \
        php7.0-xdebug \
        yarn \
        nodejs \
        chromium \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# composer
COPY --from=composer /usr/bin/composer /usr/bin/composer
