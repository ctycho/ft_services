# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/19 15:19:28 by ctycho            #+#    #+#              #
#    Updated: 2021/04/26 16:38:33 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade
RUN		apk add vsftpd openssl supervisor \
	 telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY	./srcs/vsftpd.conf				/etc/vsftpd/vsftpd.conf
COPY	./srcs/supervisord.conf			/etc/supervisord.conf
COPY	./srcs/telegraf.conf			/etc/


RUN		openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout /etc/ssl/private/key.pem \
		-out /etc/ssl/certs/crt.pem \
		-subj "/C=RU/ST=Tatarstan/L=Kazan/O=school21/CN=ctycho"

RUN		chmod -R 777 /etc/vsftpd/vsftpd.conf
RUN		adduser -D ctycho
RUN		echo "ctycho:qwerty" | chpasswd
RUN 	chown ctycho:ctycho /home/ctycho

EXPOSE	21 21000

CMD		supervisord -c /etc/supervisord.conf