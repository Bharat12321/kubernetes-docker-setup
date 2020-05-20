#!/usr/bin/env bash


minikube delete --profile demo4
kubectl config delete-cluster demo4
minikube start --vm-driver=kvm2 --profile demo4
# cd service3 && cd k8s

kubectl config use-context demo4
kubectl create namespace dev
kubectl config set-context demo4 --namespace=dev

kubectl apply -f common-k8s/postgres/

sleep 10s

kubectl apply -f service1/k8s/django/
kubectl apply -f service2/k8s/django/
kubectl apply -f service3/k8s/django/

kubectl apply -f ingress-service.yaml

# echo "server is up enjoy ....".

minikube ip --profile demo4

domain=$(minikube ip --profile demo4)

sudo -- sh -c -e "echo '$domain   minikube.local' >> /etc/hosts";

# echo "\n your server will start on http://minikube.local shortly \n"

# exec gunicorn kube101.wsgi:application \
#     --bind 0.0.0.0:8000 \
#     --workers 3
# #python manage.py runserver 0.0.0.0:8000
