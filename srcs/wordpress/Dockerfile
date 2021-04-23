# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 23:20:57 by ctycho            #+#    #+#              #
#    Updated: 2021/04/19 17:33:57 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12
RUN		apk update
RUN		apk upgrade
RUN		apk add nginx wget supervisor lighttpd php7-common php7-session php7-iconv php7-json php7-gd \
		php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi php7-pdo \
		php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt \
		php7-gettext php7-ldap php7-ctype php7-dom php7-fpm

RUN		mkdir -p /usr/share/webapps/
WORKDIR	/usr/share/webapps/
RUN		wget http://wordpress.org/latest.tar.gz
RUN		tar -xzvf latest.tar.gz
RUN		rm latest.tar.gz
RUN		chown -R lighttpd /usr/share/webapps/
RUN		ln -s /usr/share/webapps/wordpress/ /var/www/localhost/htdocs/wordpress
COPY	./srcs/wp-config.php		/usr/share/webapps/wordpress/


RUN		mkdir -p /var/run/nginx
COPY	./srcs/nginx.conf /etc/nginx/conf.d/default.conf
RUN		mkdir -p /var/run/php
COPY	./srcs/supervisord.conf		/etc/supervisord.conf


EXPOSE	5050

CMD 	supervisord -c /etc/supervisord.conf


