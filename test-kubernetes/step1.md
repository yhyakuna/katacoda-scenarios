
#### Launch Cluster

> Enter the following command into the terminal, or click on the command (`⮐`) to automatically copy it into the terminal and execute to downloads the Vault Enterprise binary for Linux.

```
launch.sh
```{{execute}}

This will create a two node Kubernetes cluster using WeaveNet for networking.

#### Health Check

```
kubectl cluster-info
```{{execute}}

Execute the following command to install the tiller service.

```
helm init
```{{execute}}

Verify that the tiller service is ready.

```
kubectl get pods --namespace kube-system
```{{execute}}


## Install Consul

Consul's Helm chart by default starts more services than required to act as Vault's storage backend.

Display the parameters in `helm-consul-values.yml`{{open}}.

Install the Consul Helm chart version 0.18.0 with pods prefixed with the name consul and apply the values found in `helm-consul-values.yml`.

```
helm install consul \
    --values helm-consul-values.yml \
    https://github.com/hashicorp/consul-helm/archive/v0.18.0.tar.gz
```{{execute}}    
