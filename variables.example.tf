## K8s variables

variable "application_name" {
  type    = string
  default = "<your_app_name>"
}

# doctl k8s options regions
variable "k8s_region" {
  type    = string
  default = "<your_region>" # exp fra01
}

variable "do_token" {
  type    = string
  default = "<your_token_value>"
}

variable "k8s_node_count" {
  type    = number
  default = "<number_of_nodes>"
}

# doctl k8s options sizes
variable "k8s_size" {
  type    = string
  default = "<size_id>" #example s-2vcpu-4gb
}

#  doctl k8s options versions
variable "k8s_version" {
  type    = string
  default = "<k8s_version>" #exmp 1.27.4-do.0
}
variable "config_path" {
  type    = string
  default = "~/.path/to/.kube/config" #default ~/.kube/config

}
variable "write_kubeconfig" {
  type        = bool
  default     = false
}
## END K8s Variables
