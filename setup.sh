#echo "verif..."
minikube stop
minikube delete --all

#echo "Brew Minikube..."
#brew install minikube

echo "Minikube start..."
minikube start --driver=virtualbox --memory='3000' --disk-size 10000MB

echo "addons..."
minikube addons enable metallb
minikube addons enable metrics-server
minikube addons enable dashboard
minikube addons list

echo "new cluster..."
minikube kubectl -- get po -A

echo "Minikube dashboard..."
minikube dashboard &

echo "metallb and namespace"
kubectl apply -f ./srcs/metallb/metallb.yaml

eval $(minikube docker-env)

echo "Nginx..."
docker build -t mynginx	./srcs/nginx/
echo "Wordpress..."
docker build -t mywordpress	./srcs/Wordpress/
echo "phpmyadmin..."
docker build -t myphpmyadmin ./srcs/Phpmyadmin/
echo "mysql..."
docker build -t mysql ./srcs/Mysql/
echo "influxdb..."
docker build -t myinfluxdb ./srcs/influxdb/
echo "Grafana..."
docker build -t mygrafana ./srcs/Grafana/
echo "ftps..."
docker build -t myftps ./srcs/FTPS/

echo "deploy..."
kubectl apply -f srcs/Mysql/sql.yaml
kubectl apply -f srcs/influxdb/influx.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/Phpmyadmin/phpmyadmin.yaml
kubectl apply -f srcs/Wordpress/wordpress.yaml
kubectl apply -f srcs/Grafana/grafana.yaml
kubectl apply -f srcs/FTPS/ftps.yaml

kubectl get svc
