# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: ctycho <ctycho@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/04/17 21:44:50 by ctycho            #+#    #+#              #
#    Updated: 2021/04/18 17:08:01 by ctycho           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	alpine:3.12
RUN		apk update
RUN		apk upgrade
RUN		apk add mysql mysql-client openrc mariadb


COPY	./srcs/my.cnf /etc/mysql
COPY	./srcs/mysql_script.sh		/
RUN		chmod +x mysql_script.sh


EXPOSE	3306

CMD 	sh mysql_script.sh