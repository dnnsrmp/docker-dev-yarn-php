FROM debian:stretch-slim

LABEL maintainer="dnnsrmp@gmail.com"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget curl \
    lsb-release \
    apt-transport-https \
    ca-certificates \
    gnupg2 \
    git \
    bzip2 \


RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -

RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg \
    && sh -c 'echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" > /etc/apt/sources.list.d/php.list'

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update \
  && apt-get install -y \
        php7.0-apcu \
        php7.0-bcmath \
        php7.0-common \
        php7.0-readline \
        php7.0-fpm \
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
        php7.0-imagick \
        php7.0-xdebug \
        php-pear \
        yarn \
        nodejs \
  && apt-get autoremove -y \
  && pecl install scrypt \
  && apt-get clean

# composer
RUN cd /tmp \
  && curl -sS https://getcomposer.org/installer -o composer-setup.php \
  && php composer-setup.php --install-dir=/usr/local/bin --filename=composer
