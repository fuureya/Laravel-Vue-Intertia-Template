# Gunakan base image PHP 8.2 dengan FPM dan Alpine
FROM php:8.2-fpm-alpine

# Install sistem dependencies dan ekstensi PHP yang dibutuhkan
RUN apk add --no-cache \
    bash \
    git \
    curl \
    unzip \
    zip \
    npm \
    nodejs \
    libzip-dev \
    oniguruma-dev \
    autoconf \
    gcc \
    g++ \
    make \
    openssl

# Install ekstensi PHP yang umum digunakan (bisa tambah sesuai kebutuhan)
RUN docker-php-ext-install pdo pdo_mysql zip

# Install Composer dari image resmi Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory di dalam container
WORKDIR /var/www/html

# Salin semua file dari host ke dalam container
COPY ./app /var/www/html

RUN apk add --no-cache nodejs npm

# Install dependencies PHP dan JavaScript
RUN composer install --no-interaction --prefer-dist --no-dev && \
    npm install

# Beri permission jika diperlukan (untuk Laravel misalnya)
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html/storage

