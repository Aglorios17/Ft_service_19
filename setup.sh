echo "verif..."
minikube stop
minikube delete --all

#echo "Brew Minikube..."
#brew install minikube

echo "Minikube start..."
minikube start --driver=virtualbox --memory='3000' --disk-size 5000MB
#minikube start


echo "addons..."
minikube addons enable metallb
minikube addons enable dashboard
minikube addons list

echo "new cluster..."
minikube kubectl -- get po -A

echo "Minikube dashboard..."
minikube dashboard &

echo "metallb..."
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml #create namespace/metallb-system
#kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml #install metallb for load balancer, on cluster under metallb-system
#On first install only, generate random bytes based secretkey
#kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey=“$(openssl rand -base64 128)”

kubectl apply -f srcs/metallb.yaml

eval $(minikube docker-env)

echo "Nginx..."
docker build -t mynginx	./srcs/nginx/
echo "Wordpress..."
docker build -t mywordpress	./srcs/Wordpress/
echo "phpmyadmin..."
docker build -t myphpmyadmin ./srcs/Phpmyadmin/
#echo "ftps..."
#docker build -t myftps ./srcs/FTPS/


echo "deploy..."
kubectl create -f srcs/nginx/nginx.yaml
kubectl create -f srcs/Wordpress/wordpress.yaml
kubectl create -f srcs/Phpmyadmin/phpmyadmin.yaml

kubectl get svc
