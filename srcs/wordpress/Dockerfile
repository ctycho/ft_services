# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 23:20:57 by ctycho            #+#    #+#              #
#    Updated: 2021/04/26 16:42:48 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12


RUN apk update \
	&&  apk upgrade \
	&&  mkdir -p /run/nginx \
	&&  mkdir -p /www \
	&&  apk add nginx       php7-fpm      supervisor \
	&&  rm -rf /var/cache/apk/*
RUN apk add php7        php7-fpm      php7-opcache \
            php7-gd     php7-mysqli   php7-zlib \
            php7-curl   php7-mbstring php7-json \
            php7-session
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN wget http://wordpress.org/latest.tar.gz
RUN tar -xf latest.tar.gz && rm -rf latest.tar.gz &&  mv wordpress/* /www

COPY ./srcs/default.conf /etc/nginx/conf.d/default.conf
COPY ./srcs/supervisord.conf /etc/supervisord.conf
COPY ./srcs/wp-config.php /www
COPY ./srcs/telegraf.conf /etc/

EXPOSE 5050

CMD 	supervisord -c /etc/supervisord.conf