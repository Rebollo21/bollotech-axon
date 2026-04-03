FROM php:8.3-fpm

# Instalar dependencias del sistema y extensiones de PHP necesarias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip

# Instalar extensiones de PHP para MySQL y Redis
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd
RUN pecl install redis && docker-php-ext-enable redis

# Instalar Composer (El motor de Laravel)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www