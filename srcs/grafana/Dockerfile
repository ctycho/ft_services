# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 13:33:16 by ctycho            #+#    #+#              #
#    Updated: 2021/04/24 04:28:00 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./srcs/grafana.ini /usr/share/grafana/conf/custom.ini
COPY ./srcs/grafana.db		/usr/share/grafana/data/grafana.db
# kubectl cp grafana-deploy-5d7cc7b9fd-9cpnk:/usr/share/grafana/data/grafana.db /Users/ctycho/check/ft_services/grafana.db

EXPOSE 3000

CMD /usr/sbin/grafana-server --homepath=/usr/share/grafana

