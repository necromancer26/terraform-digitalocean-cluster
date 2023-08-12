provider "kubernetes" {
  load_config_file = false
  host  = digitalocean_kubernetes_cluster.bluenest.endpoint
  token = digitalocean_kubernetes_cluster.bluenest.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.bluenest.kube_config[0].cluster_ca_certificate
  )
}