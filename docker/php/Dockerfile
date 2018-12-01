FROM php:7.2-fpm-alpine

RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    git \
    openssh \
    mysql-client \
    libsodium \
    imagemagick

RUN apk add --update --no-cache autoconf g++ imagemagick-dev  libtool make pcre-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && apk del autoconf g++ libtool make pcre-dev

RUN docker-php-ext-install pdo \
    pdo_mysql \
    mbstring \
    bcmath

COPY . /var/code

RUN chown -R www-data /var/code/storage
RUN chown -R www-data /var/code/public
RUN chown -R www-data /var/code/bootstrap/cache


