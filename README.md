****
# Setup
****

# Install Docker
	sudo apt install docker.io

# Start and Automate Docker
	sudo systemctl start docker
	sudo systemctl enable docker

# Check Docker Version
	docker --version

# Install Minikube

    wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
    cp minikube-linux-amd64 /usr/local/bin/minikube
    chmod 755 /usr/local/bin/minikube
    minikube version

# Install Kubectl
    curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
    echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list
    apt-get update -y
    apt-get install kubectl -y
    
    kubectl version -o json


****
# UseFul Commands
****


# Start Minikube
    minikube start --vm-driver=kvm2 --cpus 4 --memory 8192 --profile l-2

# check the cluster status with the following command:
    kubectl config view

# To check the running nodes, run the following command:
    kubectl get nodes

# access the Minikube Virtualbox with the following command:
    minikube ssh

# Exit from the Virtualbox shell:
    exit
    
# Stop and delete kubernetes cluster:
    minikube delete
    minikube delete

# list all the minikube addons:
    minikube addons list

# list all the container image running in the cluster:
    kubectl get pods --all-namespaces

# get the URL of the kubernate dashboard:
    minikube dashboard --url

# Now, run the following command to create the namespace:
    kubectl create namespace dev

# get current cluster:
    kubectl config current-context

# change cluster for using:
    kubectl config use-context <cluster_name>

# set namespace to cluster:
    kubectl config set-context <cluster_name> --namespace=dev

# Now, run the following command to create the deployment, service:
    kubectl create -f deployment.yaml
    kubectl create -f service.yaml

# get service url for browsing:
    minikube service -n <namespace_name> -p <cluster_name> <service_name> --url

# enable ingress addon to use:
    minikube addons enable ingress --profile <cluster_name>

# get running ingress:
    kubectl get ing

# get services:
    kubectl get svc

# get logs for particular pod:
    kubectl get pods <pod_name>

# bash entering to any pod
    kubectl exec -it <pod_name> bash

