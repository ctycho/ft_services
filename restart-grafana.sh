eval $(minikube docker-env)

kubectl delete deployment grafana-deploy

docker build -t my_grafana ./srcs/grafana 
kubectl apply -f ./srcs/grafana/srcs/grafana.yaml