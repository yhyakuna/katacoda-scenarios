
#### Launch Cluster

> Enter the following command into the terminal, or click on the command (`⮐`) to automatically copy it into the terminal and execute to downloads the Vault Enterprise binary for Linux.


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

First, clone the `consul-helm` Github repo:

```
git clone https://github.com/hashicorp/consul-helm.git
```{{execute}}

Create a Kubernetes service account called `tiller`:

```
kubectl --namespace kube-system create serviceaccount tiller
```{{execute}}

Next, create a Kubernetes clusterrolebinding between the cluster-admin role and the tiller service account. You do not need to customize the following command:

```
kubectl create clusterrolebinding tiller-cluster-rule \
  --clusterrole=cluster-admin --serviceaccount=kube-system:tiller
```{{execute}}

Patch your kube-system namespace to respect the tiller service account:

```
kubectl --namespace kube-system patch deploy tiller-deploy \
  -p '{"spec":{"template":{"spec":{"serviceAccount":"tiller"}}}}'
```{{execute}}

Now, you can deploy Consul using helm install.

```
helm install -f helm-consul-values.yaml hashicorp ./consul-helm
```{{execute}}

or try...


```
helm install consul \
    --values helm-consul-values.yml \
    https://github.com/hashicorp/consul-helm/archive/v0.18.0.tar.gz
```{{execute}}    
