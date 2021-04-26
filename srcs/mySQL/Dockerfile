# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 21:44:50 by ctycho            #+#    #+#              #
#    Updated: 2021/04/26 16:39:57 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update
RUN		apk upgrade
RUN		apk add mysql mysql-client openrc mariadb mariadb-client supervisor \
		telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache && \
		mkdir -p /run/mysqld/

COPY	./srcs/telegraf.conf		/etc/
COPY	./srcs/supervisord.conf		/etc/supervisord.conf
COPY	./srcs/mydb.sql				./
COPY	./srcs/my.cnf				/etc/
COPY	./srcs/mysql_script.sh		/

EXPOSE	3306

CMD 	sh mysql_script.sh