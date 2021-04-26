# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 13:33:16 by ctycho            #+#    #+#              #
#    Updated: 2021/04/26 16:39:03 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12

RUN echo "http://dl-2.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk update && apk upgrade
RUN apk add grafana telegraf supervisor

COPY	./srcs/supervisord.conf			/etc/supervisord.conf
COPY	./srcs/telegraf.conf			/etc/
COPY ./srcs/grafana.db					/usr/share/grafana/data/grafana.db

EXPOSE 3000

CMD supervisord -c /etc/supervisord.conf
