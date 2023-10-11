provider "kubernetes" {
  host = digitalocean_kubernetes_cluster.bluenest.endpoint
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.bluenest.kube_config[0].cluster_ca_certificate
  )
  exec {
    api_version = "client.authentication.k8s.io/v1beta1"
    command     = "doctl"
    args = ["kubernetes", "cluster", "kubeconfig", "exec-credential",
    "--version=v1beta1", digitalocean_kubernetes_cluster.bluenest.id]
  }
}