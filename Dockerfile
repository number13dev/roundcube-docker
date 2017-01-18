FROM ubuntu

RUN apt-get -qq update
RUN apt-get install -qq \
    nginx \
    php-fpm php-mysql php-xml php-mbstring php-intl php-ldap \
    wget \
    dovecot-core

RUN echo "cgi.fix_pathinfo=0" >> /etc/php/7.0/fpm/php.ini
RUN echo "extension=php_intl.dll" >> /etc/php/7.0/fpm/php.ini


#add files
ADD run.sh run.sh
ADD create_db.sh
ADD default default
ADD password password
ADD config.inc.php config.inc.php

RUN chmod +x run.sh
RUN chmod +x create_db.sh

RUN wget https://github.com/roundcube/roundcubemail/releases/download/1.2.3/roundcubemail-1.2.3-complete.tar.gz
RUN tar xfz roundcubemail-1.2.3-complete.tar.gz
RUN rm roundcubemail-1.2.3-complete.tar.gz
RUN rm -rf /var/www/html
RUN cp -R roundcubemail-1.2.3 /var/www/html

EXPOSE 80 443
CMD ["./run.sh"]