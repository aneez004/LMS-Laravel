FROM bitnami/laravel

RUN apt update -y && apt install php-mysql -y

WORKDIR /app

COPY . .

RUN composer update

RUN php artisan key:generate
ENTRYPOINT php artisan migrate --seed
