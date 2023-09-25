#!/bin/bash
kubectl get deploy -n $EKS_NAMESPACE  -o wide
kubectl get svc -n $EKS_NAMESPACE  -o wide
deploy8080=$(kubectl get svc -n $EKS_NAMESPACE -o wide | grep ' 8080:' | tr ' ' '\n' | grep app | awk -F= '{print $NF}')
deploy80=$(kubectl get svc -n $EKS_NAMESPACE -o wide | grep ' 80:' | tr ' ' '\n' | grep app | awk -F= '{print $NF}')
echo "$deploy80 $deploy8080"
kubectl patch svc ${SERVICE_NAME}-bknd-svc-80 -n $EKS_NAMESPACE -p '{"spec":{"selector": {"app.kubernetes.io/name": "'$deploy8080'"}}}'
kubectl patch svc ${SERVICE_NAME}-bknd-svc-8080 -n $EKS_NAMESPACE -p '{"spec":{"selector": {"app.kubernetes.io/name": "'$deploy80'"}}}'
kubectl get deploy -n $EKS_NAMESPACE -o wide
kubectl get svc -n $EKS_NAMESPACE -o wide
