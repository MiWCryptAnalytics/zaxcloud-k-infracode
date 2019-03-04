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
