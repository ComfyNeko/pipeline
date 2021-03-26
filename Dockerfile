FROM php:7.4-apache
COPY . /var/www/php
ENV PORT 8080
CMD ["./pipeline"]
