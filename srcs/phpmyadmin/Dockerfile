# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/19 12:37:13 by ctycho            #+#    #+#              #
#    Updated: 2021/04/26 16:42:06 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN apk update && apk upgrade && apk add --no-cache openrc \
    bash nginx supervisor \
    mysql mysql-client \
    php7-mysqlnd php7 php7-fpm\
    php7-common php7-iconv php7-json php7-gd php7-curl php7-xml \
    php7-mysqli php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc \
    php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom  php7-session php7-mbstring \
    telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    wget

RUN mkdir -p /run/nginx
COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/telegraf.conf /etc/
WORKDIR /www

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.4-english.tar.gz && rm -rf phpMyAdmin-5.0.4-english.tar.gz
RUN mv phpMyAdmin-5.0.4-english/* ./
RUN rm -rf phpMyAdmin-5.0.4-english
COPY ./srcs/config.inc.php /www/
RUN mkdir -p /www/tmp

EXPOSE 5000

CMD 	supervisord -c /etc/supervisord.conf