FROM debian:buster

RUN	apt-get update && apt-get upgrade && apt-get -y install \
        mariadb-client \
		    wget \
        curl \
        bash \
        php7.3 \
        php7.3-cgi \
        php7.3-mysql \
        php7.3-fpm \
        php7.3-pdo \
        php7.3-gd \
        php7.3-cli \
        php7.3-mbstring \
        && rm -rf /var/lib/apt/lists/*
	
		

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
  && chmod +x wp-cli.phar \
  && mv wp-cli.phar /usr/local/bin/wp

COPY www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php

COPY config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh
ENTRYPOINT ["/usr/local/bin/config.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]