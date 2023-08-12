## K8s variables

variable "application_name" {
  type = string
  default = "bluenest-cluster"
}

# doctl k8s options regions
variable "k8s_region" {
  type = string
  default = "fra1"
}

# variable "do_token" {
#   type = string
#   default = "digitalocean_token_value"
# }

variable "k8s_node_count" {
  type = number
  default = 2
}

# doctl k8s options sizes
variable "k8s_size" {
  type = string
  default = "s-2vcpu-4gb"
}

#  doctl k8s options versions
variable "k8s_version" {
  type = string
  default = "1.27.4-do.0"
}

## END K8s Variables