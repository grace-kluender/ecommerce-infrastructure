resource "null_resource" "namespace" {

  provisioner "local-exec" {
    command = "kubectl create namespace ${var.namespace} || true"
  }

}