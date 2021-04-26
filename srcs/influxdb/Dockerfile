# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/23 01:47:51 by ctycho            #+#    #+#              #
#    Updated: 2021/04/25 07:44:47 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN		apk update && apk upgrade
RUN		apk add influxdb wget supervisor telegraf

RUN		mkdir -p /var/lib/influxdb
COPY	./srcs/telegraf.conf		/etc/
COPY	./srcs/supervisord.conf		/etc/supervisord.conf
COPY	./srcs/telegraf.conf		/etc/

EXPOSE	8086

CMD		supervisord -c /etc/supervisord.conf