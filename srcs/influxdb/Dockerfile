# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/23 01:47:51 by ctycho            #+#    #+#              #
#    Updated: 2021/04/24 03:04:24 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12

RUN		apk update && apk upgrade
RUN		apk add influxdb wget supervisor

RUN		wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN		wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.32-r0/glibc-2.32-r0.apk
RUN		apk add glibc-2.32-r0.apk
RUN		wget https://dl.influxdata.com/telegraf/releases/telegraf-1.15.2_linux_amd64.tar.gz
RUN		tar -zxf telegraf-1.15.2_linux_amd64.tar.gz && mv telegraf-1.15.2 telegraf
RUN		rm telegraf-1.15.2_linux_amd64.tar.gz && cp -r telegraf/* /
RUN		mkdir -p /var/lib/influxdb
COPY	./srcs/supervisord.conf		/etc/supervisord.conf
# COPY	./srcs/telegraf.conf		/etc/
RUN telegraf -sample-config  --input-filter docker --output-filter influxdb > /etc/telegraf.conf

EXPOSE	8086

CMD		supervisord -c /etc/supervisord.conf