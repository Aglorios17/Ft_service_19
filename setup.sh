echo "verif..."
minikube stop
minikube delete --all

echo "Brew Minikube..."
#brew minikube

echo "Minikube start..."
minikube start --extra-config=apiserver.service-node-port-range=1-6000

#echo "addons..."
#minikube addons enable ingress
#minikube addons enable dashboard

echo "new cluster..."
minikube kubectl -- get po -A

echo "Minikube dashboard..."
minikube dashboard &

eval $(minikube docker-env)

echo "Nginx..."
docker build -t mynginx	./srcs/nginx/
docker build -t mywordpress	./srcs/Wordpress/
docker build -t myphpmyadmin ./srcs/Phpmyadmin/
docker build -t myftps ./srcs/FTPS/

echo "deploy..."
#kubectl	-- get pods
kubectl run nginx-deployement --image=mynginx:latest --image-pull-policy=Never
kubectl run wordpress-deployement --image=mywordpress:latest --image-pull-policy=Never
kubectl run phpmyadmin-deployement --image=myphpmyadmin:latest --image-pull-policy=Never
kubectl run ftps-deployement --image=myftps:latest --image-pull-policy=Never

kubectl expose deployment nginx-deployement --type=NodePort --port=80 --target-port=443
kubectl expose deployment wordpress-deployement --type=NodePort --port=5050
kubectl expose deployment phpmyadmin-deployement --type=NodePort --port=5000
kubectl expose deployment ftps-deployement --type=NodePort --port=21
minikube service list
