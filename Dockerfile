FROM tiredofit/freescout:latest

# Отключаем OPcache, если он уже загружен
RUN echo "opcache.enable=0" >> /etc/php/7.4/cli/conf.d/99-opcache.ini
RUN echo "opcache.enable=0" >> /etc/php/7.4/fpm/conf.d/99-opcache.ini

# Устанавливаем рабочую директорию
WORKDIR /var/www/html

# Устанавливаем права на выполнение скриптов
RUN chmod +x /etc/services.d/*/run

# Копируем конфиг файл с переменными
COPY .env .env

# Открываем нужный порт
EXPOSE 80

# Запускаем сервер
CMD ["php-fpm"]
