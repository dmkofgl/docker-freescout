FROM tiredofit/freescout:latest

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
