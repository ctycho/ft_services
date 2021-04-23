# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/14 15:50:21 by ctycho            #+#    #+#              #
#    Updated: 2021/04/18 13:09:42 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12
RUN		apk update
RUN		apk upgrade
RUN		apk add nginx openssl supervisor openssh

RUN		mkdir -p /run/nginx
RUN		mkdir -p /etc/ssl
RUN		mkdir -p /var/log/nginx
RUN		mkdir -p /www
#RUN		ssh-keygen -A && adduser -D ctycho && echo "ctycho:123" | chpasswd

COPY	./srcs/script-start.sh /etc/ssl/
COPY	./srcs/default.conf				/etc/nginx/conf.d/default.conf
COPY	./srcs/supervisord.conf			/etc/supervisord.conf
COPY	./srcs/index.html				/www/index.html


WORKDIR /etc/ssl/
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout key.key \
	-out key.crt \
	-subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=ctycho"
RUN		chmod +x script-start.sh
	
EXPOSE	80 443

CMD		sh script-start.sh