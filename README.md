# zaxcloud-k-infracode
K8s Infracode for zaxcloud

Mastodon Kube deployment infracode based on https://github.com/ericflo/kube-mastodon

Infrastructure as Code Repository for deploying Mastodon on GKE Kubernetes
* This repo is specific for zax.cloud and requires a number of specific ENVs. It will require:
```
  DB_PASS
  PAPERCLIP_SECRET
  SECRET_KEY_BASE
  OTP_SECRET
  LOCAL_DOMAIN
  SMTP_SERVER
  SMTP_PORT
  SMTP_LOGIN
  SMTP_PASSWORD
  SMTP_FROM_ADDRESS
  SMTP_DOMAIN
  VAPID_PRIVATE_KEY
  VAPID_PUBLIC_KEY
``` 
  These can all be obtained for your environment and as per mastodon deployment documentation.
  These variables are configured in circleci

## Go

Repo is configured against CircleCI, and changes to this repo will deploy to production server.

## Fork
To deploy this on your own GKE, define appropriate environment vars and change deployment templates as needed.

## Caveats
1.
You will need to have granted the cluster CloudDNS rights for this to work OOB.

The create-cluster.sh script adds lots of VM rights
(which must be set at build time. You cannot grant additional rights to a VM after it is built in GCP).

If you run into permission issues on existing clusters, you will need to provide GCP CloudDNS granting credentials to the external-dns container.

2. There might be something funny with creating a cluster role binding; it does need to be run once in a clusters lifetime. But it cannot live in the ci scripts as it will break the build if the role exists. Deploy once from CI if needed and remove on next build.

```
    kubectl create clusterrolebinding cluster-admin-binding   --clusterrole cluster-admin   --user $(gcloud config get-value account)
```
