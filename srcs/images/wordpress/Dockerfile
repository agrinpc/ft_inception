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

# Copy the .conf in the html directory
COPY www.conf /etc/php/7.3/fpm/pool.d/

#Create the folder to enable php start
RUN mkdir /run/php

#we copy the script, give the right to launch it in local on our computer
COPY config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh
ENTRYPOINT ["/usr/local/bin/config.sh"]

#We go the html directory
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["/usr/sbin/php-fpm7.3", "-F"]