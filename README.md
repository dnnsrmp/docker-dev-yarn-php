# docker-dev-yarn

[![Docker Build Status](https://img.shields.io/docker/build/dnnsrmp/dev-yarn-php.svg)](https://hub.docker.com/r/dnnsrmp/dev-yarn-php/)

A docker image which includes:

- [PHP 7.3](http://php.net/) with following extensions
  - apcu
  - bcmath
  - readline
  - mysql
  - sqlite
  - curl
  - intl
  - mbstring
  - opcache
  - json
  - pdo
  - memcached
  - zip
  - xsl
  - gmagick
  - xdebug
- [nodejs 10.x](https://nodejs.org)
- [yarn](https://yarnpkg.com)
- [composer](https://getcomposer.org/)

It also contains `curl`, `wget`, `gnupg2` and `git` for reasons.

You can find the image on the official [docker registry](https://hub.docker.com/r/dnnsrmp/dev-yarn-php/)

```bash
docker pull dnnsrmp/dev-yarn-php:latest
```
