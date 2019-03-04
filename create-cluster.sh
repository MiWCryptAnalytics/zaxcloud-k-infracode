#!/bin/bash
export PROJECT_NAME=zaxcloud
export CUSTOM_DOMAIN=zax.cloud

export CLUSTER_NAME=zaxcloud-cluster
export CLUSTER_ZONE=us-central1-a

gcloud container clusters create $CLUSTER_NAME \
    --zone=$CLUSTER_ZONE \
    --cluster-version=1.11.6-gke.3 \
    --machine-type=n1-standard-1 \
    --enable-autorepair \
    --enable-autoupgrade \
    --no-enable-legacy-authorization \
    --no-enable-basic-auth \
    --metadata disable-legacy-endpoints=true \
    --scopes=service-control,service-management,compute-rw,storage-ro,cloud-platform,logging-write,monitoring-write,pubsub,datastore,"https://www.googleapis.com/auth/ndev.clouddns.readwrite" \
    --num-nodes=1