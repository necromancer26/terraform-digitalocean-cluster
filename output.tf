# once the provisioning is done the id of the cluster is shown on the console
output "cluster-id" {
  value = digitalocean_kubernetes_cluster.bluenest.id
}