terraform {
  backend "s3" {
    endpoint = "fra1.digitaloceanspaces.com" #endpoint
    key      = "cluster/terraform.tfstate" #path
    bucket   = "green-bubble" # bucket-name
    region   = "eu-central-1" #region
    # acl      = # example "bucket-owner-read"
    # skip_requesting_account_id  = true
    # skip_credentials_validation = true
    # skip_get_ec2_platforms      = true
    skip_metadata_api_check = true
  }
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
provider "digitalocean" {
  token = var.digitalocean_token
}
resource "digitalocean_kubernetes_cluster" "bluenest" {
  name    = var.application_name
  region  = var.k8s_region
  version = var.k8s_version
  tags    = ["k8s"]
  node_pool {
    name       = "bluenest-worker-pool"
    size       = var.k8s_size
    node_count = var.k8s_node_count
    tags       = ["worker"]
  }
}
