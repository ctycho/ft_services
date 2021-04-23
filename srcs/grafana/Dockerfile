# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/21 13:33:16 by ctycho            #+#    #+#              #
#    Updated: 2021/04/23 03:10:16 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM alpine:3.12
RUN apk update && apk upgrade
RUN apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/community/ --allow-untrusted --no-cache

COPY ./srcs/grafana.ini /usr/share/grafana/conf/custom.ini
# COPY srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/
# COPY srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/
# COPY srcs/global.json /var/lib/grafana/dashboards/
# COPY srcs/nginx.json /var/lib/grafana/dashboards/
# COPY srcs/phpmyadmin.json /var/lib/grafana/dashboards/
# COPY srcs/influxdb.json /var/lib/grafana/dashboards/
# COPY srcs/ftps.json /var/lib/grafana/dashboards/
# COPY srcs/mysql.json /var/lib/grafana/dashboards/
# COPY srcs/telegraf.json /var/lib/grafana/dashboards/
# COPY srcs/wordpress.json /var/lib/grafana/dashboards/
# COPY srcs/grafana.json /var/lib/grafana/dashboards/

EXPOSE 3000

CMD /usr/sbin/grafana-server --homepath=/usr/share/grafana

