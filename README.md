# gcloud-tf

Collection of Terraform scripts used to set up infrastructure on GCP. 

## Setting up the environment

Create a service account and set up `GOOGLE_CLOUD_KEYFILE_JSON` environment variable:

```
export GOOGLE_CLOUD_KEYFILE_JSON=/path/to/service-account.json
```

Check [creating-managing-service-accounts](https://cloud.google.com/iam/docs/creating-managing-service-accounts) for more information.

## Getting started with Terraform 

Initialize Terrafrom and check the execution plan:

```
terraform init
terraform plan
```

Provision the environment with `terraform apply`. Don't forget to clean up the infrastructure when you don't use it - `terraform destroy`
