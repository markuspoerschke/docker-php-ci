FROM php:7.0

RUN apt-get update -y \
    && apt-get install openssh-client -y \
    && apt-get install git -y \
    && apt-get install zlib1g-dev

RUN docker-php-ext-install zip mysqli

RUN   php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
      && php composer-setup.php --install-dir=/usr/local/bin --filename=composer \
      && php -r "unlink('composer-setup.php');"
