# gcloud-tf

Collection of Terraform scripts used to set up infrastructure on GCP. 

## Setting up the environment

Create a service account and set up `GOOGLE_CLOUD_KEYFILE_JSON` environment variable:

```
export GOOGLE_CLOUD_KEYFILE_JSON=/path/to/service-account.json
```

Check [creating-managing-service-accounts](https://cloud.google.com/iam/docs/creating-managing-service-accounts) for more information.

Set up new `gcloud` configuration. This is especially handy if you are working with multiple projects/environments:

```
gcloud config configurations create some-project
```

Edit `~/.config/gcloud/configurations/config_some-project` file:

```
[core]
account = <your-account>
project = <your-project>

[compute]
zone = europe-west4-b
region = europe-west4
```

You can check configuration list afterwards - `gcloud config configurations list`.

Alternatively, you can include provider related configuration in `provider` block:

```
provider "google" {
  project = "{{YOUR GCP PROJECT}}"
  region  = "us-central1"
  zone    = "us-central1-c"
}
```

## Getting started with Terraform 

Initialize Terrafrom and check the execution plan:

```
terraform init
terraform plan
```

Provision the environment with `terraform apply`. Don't forget to clean up the infrastructure when you don't use it - `terraform destroy`

