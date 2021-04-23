# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/23 01:47:51 by ctycho            #+#    #+#              #
#    Updated: 2021/04/23 03:53:57 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk upgrade
RUN		apk add influxdb wget supervisor
RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
RUN		tar -zxf telegraf-1.15.2_linux_amd64.tar.gz && mv telegraf-1.15.2 telegraf
RUN		rm telegraf-1.15.2_linux_amd64.tar.gz && cp -r telegraf/* /
RUN		mkdir -p /var/lib/influxdb
COPY	./srcs/supervisord.conf		/etc/supervisord.conf
COPY	./srcs/telegraf.conf		/etc/

EXPOSE	8086

CMD		supervisord -c /etc/supervisord.conf