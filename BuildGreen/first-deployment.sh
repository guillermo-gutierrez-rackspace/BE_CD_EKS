#!/bin/bash
## Revisar si se cuenta con despliegues previos
checkDeployments=$(kubectl get pods -n $EKS_NAMESPACE | grep -v "^NAME" | wc -l| awk '{print $1}')
if [ $checkDeployments -eq 0 ]
then
    echo "[INFO] No previus deployments found in $EKS_NAMESPACE namespace"
    echo "[INFO] Start with the first Deployment"
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-namespace.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-namespace.yml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-serviceaccount.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-serviceaccount.yml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-green.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-green.yml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-blue.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-deployment-blue.yml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-green.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-green.yml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-blue.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-service-blue.yml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-blue.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-blue.yml
    cat              $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-green.yml
    kubectl apply -f $CODEBUILD_SRC_DIR_AppSourceOutput/k8s/app-ingress-green.yml
fi
