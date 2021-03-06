---
title: "Kubernetes Commands"
date: 2019-07-04T15:23:27+08:00
draft: false
images: []
---

## Create/run

- kubectl run busybox --rm -it --image=busybox /bin/sh
- kubectl run nginx --image=nginx --replicas=2
- kubectl run nginx --image=nginx --dry-run
- kubectl create -f a-file.yml
- kubectl create deployment kubernetes-bootcamp --image=gcr.io/google-samples/kubernetes-bootcamp:v1


## Get info

- kubectl -h or --help
- kubectl $command --help
- kubectl cluster-info
- kubectl get nodes
- kubectl get pods -o wide --all-namespaces
- kubectl get po -o yaml
- kubectl get pod -l app=ratings -o jsonpath='{.items[0].metadata.name}'
- kubectl get pods -o go-template --template '{{range.items}}{{.metadata.status}}{{"\n"}}{{end}}'
- kubectl get deployments
- kubectl get services
- kubectl get namespace
- kubectl get pv
- kubectl get statefulsets
- kubectl describe resName
- kubectl explain resName
- kubectl proxy and curl http://localhost:8001/version


## Trouble shooting

- kubectl logs -p $pod -c $container
- kubectl logs --since=1h nginx
- kubectl exec -it myPodName -c containerNameInMyPod /bin/sh

## Apply changes

- kubectl apply -f a-file.yml
- kubectl delete -f a-file.yml
- kubectl scale --replicas=3 deployment/nginx

