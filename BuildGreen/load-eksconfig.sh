#!/bin/bash
set -e

sudo mkdir -p $HOME/.kube
export KUBECONFIG=$HOME/.kube/config

if [[ ! -z ${AWS_REGION} ]]; then
    region=$AWS_REGION
    echo "[INFO] region=$AWS_REGION"
else 
    echo "REGION not defined, trying to lookup from EC2 metadata..."
    region=$(curl -s http://169.254.169.254/latest/dynamic/instance-identity/document | jq .region -r)
fi

export AWS_DEFAULT_REGION=$region

#CLUSTER_NAME=${CLUSTER_NAME-default}

update_kubeconfig(){
    if [[ -n ${EKS_ROLE_ARN} ]]; then
        echo "[INFO] got EKS_ROLE_ARN=${EKS_ROLE_ARN}, updating kubeconfig with this role"
        aws eks update-kubeconfig --name $CLUSTER_NAME --kubeconfig $KUBECONFIG --role-arn "${EKS_ROLE_ARN}" --region $region
    else
        aws eks update-kubeconfig --name $CLUSTER_NAME --kubeconfig $KUBECONFIG --region $region
    fi
    cat $KUBECONFIG
}

update_kubeconfig
exec "$@"
