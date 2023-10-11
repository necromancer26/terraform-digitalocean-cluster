terraform {
  backend "s3" {
    endpoint = "fra1.digitaloceanspaces.com" #endpoint
    key      = "cluster/terraform.tfstate"   #path
    bucket   = "green-bubble"                # bucket-name
    region   = "eu-central-1"                #region
    # acl      = # example "bucket-owner-read"
    # skip_requesting_account_id  = true
    skip_credentials_validation = true
    # skip_get_ec2_platforms      = true
    skip_metadata_api_check = true
  }
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.8.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.10.1"
    }
    kubectl = {
      source  = "gavinbunney/kubectl"
      version = ">= 1.7.0"
    }
  }

}
# data "digitalocean_kubernetes_cluster" "primary" {
#   name = var.application_name
# }

provider "digitalocean" {
  token = var.do_token
}

resource "digitalocean_kubernetes_cluster" "bluenest" {
  name    = var.application_name
  region  = var.k8s_region
  version = var.k8s_version
  tags    = ["k8s"]
    auto_upgrade = true

  node_pool {
    name         = "bluenest-worker-pool"
    size         = var.k8s_size
    node_count   = var.k8s_node_count
    tags         = ["worker"]
    auto_scale   = true
    min_nodes    = 1
    max_nodes    = 2

  }
  maintenance_policy {
    start_time = "04:00"
    day        = "sunday"
  }
}
resource "null_resource" "kubectl" {
    provisioner "local-exec" {
        command = "doctl kubernetes cluster kubeconfig save ${digitalocean_kubernetes_cluster.bluenest.id}"
    }
}