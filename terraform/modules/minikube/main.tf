resource "null_resource" "minikube_cluster" {

  provisioner "local-exec" {
    command = "minikube start --cpus=${var.cpu} --memory=${var.memory}"
  }

}