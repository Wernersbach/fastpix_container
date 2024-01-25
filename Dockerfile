FROM php:8.1-apache

COPY web /var/www/html

RUN docker-php-ext-install mysqli pdo pdo_mysql

# Gera um certificado autoassinado e uma chave
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/my_private.key \
    -out /etc/ssl/certs/my_certificate.crt \
    -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=Fastpix/OU=Develop/CN=fastpix.com"

# Ativa o módulo SSL do Apache
RUN a2enmod ssl

# Copia a configuração do Virtual Host para o container
COPY 000-default-ssl.conf /etc/apache2/sites-available/

# Ativa o novo Virtual Host
RUN a2ensite 000-default-ssl

EXPOSE 80
EXPOSE 443
