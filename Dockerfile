FROM php:8.3-apache
WORKDIR /var/www/html

RUN a2enmod rewrite

RUN apt-get update -y && apt-get install -y \
    unzip zip libmariadb-dev libicu-dev zlib1g-dev

RUN docker-php-ext-install pdo pdo_mysql intl

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer
COPY .env.example .env

RUN sed -i 's|/var/www/html|/var/www/html/public|g' /etc/apache2/sites-available/000-default.conf