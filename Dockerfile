FROM composer:latest AS composer

FROM debian:stretch-slim

LABEL maintainer="dnnsrmp@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    sudo \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    apt-utils \
    libtool \
    gconf-service \
    libmcrypt-dev \
    libasound2 \
    libatk1.0-0 \
    libatk-bridge2.0-0 \
    libc6 \
    libcairo2 \
    libcups2 \
    libdbus-1-3 \
    libexpat1 \
    libfontconfig1 \
    libgcc1 \
    libgconf-2-4 \
    libgdk-pixbuf2.0-0 \
    libglib2.0-0 \
    libgtk-3-0 \
    libnspr4 \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libstdc++6 \
    libx11-6 \
    libx11-xcb1 \
    libxcb1 \
    libxcomposite1 \
    libxcursor1 \
    libxdamage1 \
    libxext6 \
    libxfixes3 \
    libxi6 \
    libxrandr2 \
    libxrender1 \
    libxss1 \
    libxtst6 \
    fonts-liberation \
    libappindicator1 \
    libnss3 \
    lsb-release \
    xdg-utils \
    apache2-dev \
    bzip2 \
    git \
    wget \
    curl \
    nano

RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
    && apt-get install -y --no-install-recommends --autoremove \
        php7.3-apcu \
        php7.3-bcmath \
        php7.3-common \
        php7.3-readline \
        php7.3-fpm \
        php7.3-gd \
        php7.3-cli \
        php7.3-mysql \
        php7.3-sqlite \
        php7.3-curl \
        php7.3-intl \
        php7.3-mbstring \
        php7.3-opcache \
        php7.3-json \
        php7.3-pdo \
        php7.3-memcached \
        php7.3-zip \
        php7.3-xsl \
        php7.3-gmagick \
        php7.3-xdebug \
        yarn \
        nodejs \
        chromium \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer /usr/bin/composer /usr/bin/composer