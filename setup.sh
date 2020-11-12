echo "verif..."
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

echo "Minikube docker-env..."
eval $(minikube docker-env)

echo "metallb"
kubectl apply -f ./srcs/metallb/configmetallb.yaml

echo "mysql..."
docker build -t mysql ./srcs/Mysql/
echo "influxdb..."
docker build -t myinfluxdb ./srcs/influxdb
echo "Wordpress..."
docker build -t mywordpress	./srcs/Wordpress/

echo "phpmyadmin..."
docker build -t myphpmyadmin ./srcs/Phpmyadmin/
kubectl apply -f srcs/Phpmyadmin/phpmyadmin.yaml

PHPIP=$(kubectl get service phpmyadmin-service | grep "phpmyadmin-service" | awk '{print $3}')
echo $PHPIP
sed "31 s/pma/$PHPIP/" srcs/nginx/srcs/nginx > srcs/nginx/srcs/nginx.conf

echo "Nginx..."
docker build -t mynginx	./srcs/nginx/
echo "Grafana..."
docker build -t mygrafana ./srcs/Grafana/
echo "ftps..."
docker build -t myftps ./srcs/FTPS/

echo "deploy.."
kubectl apply -f srcs/Mysql/sql.yaml
kubectl apply -f srcs/influxdb/influx.yaml
kubectl apply -f srcs/Wordpress/wordpress.yaml
kubectl apply -f srcs/nginx/nginx.yaml
kubectl apply -f srcs/Grafana/grafana.yaml
kubectl apply -f srcs/FTPS/ftps.yaml

kubectl get svc
