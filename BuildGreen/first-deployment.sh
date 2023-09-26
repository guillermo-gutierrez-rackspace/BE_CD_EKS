#!/bin/bash
## Revisar si se cuenta con despliegues previos
checkDeployments=$(kubectl get pods -n $EKS_NAMESPACE | grep -v "^NAME" | wc -l| awk '{print $1}')
if [ $checkDeployments -eq 0 ]
then
    echo "[INFO] No previus deployments found in $EKS_NAMESPACE namespace"
    echo "[INFO] Start with the first Deployment"
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-namespace.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-namespace.yaml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-serviceaccount.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-serviceaccount.yaml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-green.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-green.yaml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-blue.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-blue.yaml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-green.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-green.yaml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-blue.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-blue.yaml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-blue.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-blue.yaml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-green.yaml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-green.yaml
fi
