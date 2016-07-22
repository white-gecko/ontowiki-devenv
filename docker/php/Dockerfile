FROM php:5.6-fpm

# Configure odbc
# as of https://github.com/docker-library/php/issues/103
RUN apt-get update && apt-get install -y unixODBC-dev libvirtodbc0 && rm -rf /var/lib/apt/lists/*
RUN docker-php-source extract \
    && set -x \
    && cd /usr/src/php/ext/odbc \
    && phpize \
    && sed -ri 's@^ *test +"\$PHP_.*" *= *"no" *&& *PHP_.*=yes *$@#&@g' configure \
    && ./configure --with-unixODBC=shared,/usr \
    && docker-php-ext-install odbc \
    && docker-php-source delete

# Add odbc configuration for virtuoso
RUN set -ex \
 && { \
  echo '[ODBC Data Sources]'; \
  echo 'VOS = Virtuoso'; \
  echo 'VOS_TEST = Virtuoso Test'; \
  echo; \
  echo '[VOS]'; \
  echo 'Driver = /usr/lib/odbc/virtodbc.so'; \
  echo 'Address = virtuoso-dev:1111'; \
  echo; \
  echo '[VOS_TEST]'; \
  echo 'Driver = /usr/lib/odbc/virtodbc.so'; \
  echo 'Address = virtuoso-test:1111'; \
 } | tee /etc/odbc.ini

CMD ["/usr/local/sbin/php-fpm"]
