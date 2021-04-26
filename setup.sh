#!/bin/sh

minikube stop
minikube delete
minikube start --vm-driver=virtualbox --cpus=4 --memory=4G --disk-size=50G
eval $(minikube docker-env)
minikube addons enable metallb

docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2
docker pull kubernetesui/dashboard:v2.1.0
docker pull kubernetesui/metrics-scraper:v1.0.4

docker build -t nginx-image ./srcs/nginx/
docker build -t my_wordpress ./srcs/wordpress/
docker build -t my_sql ./srcs/mySQL/
docker build -t my_php ./srcs/phpmyadmin/
docker build -t my_ftps ./srcs/ftps/
docker build -t my_grafana ./srcs/grafana
docker build -t my_influx ./srcs/influxdb/

kubectl apply -f ./srcs/configmap.yaml
kubectl apply -f ./srcs/nginx/srcs/nginx.yaml
kubectl apply -f ./srcs/mySQL/srcs/mysql-deployment.yaml
kubectl apply -f ./srcs/wordpress/srcs/wordpress-deployment.yaml 
kubectl apply -f ./srcs/mySQL/srcs/mysql-deployment.yaml
kubectl apply -f ./srcs/phpmyadmin/srcs/phpma.yaml
kubectl apply -f ./srcs/ftps/srcs/ftps.yaml
kubectl apply -f ./srcs/grafana/srcs/grafana.yaml
kubectl apply -f ./srcs/influxdb/srcs/influxdb.yaml

