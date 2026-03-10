resource "null_resource" "postgres" {

  provisioner "local-exec" {
    command = "docker run -d -p ${var.db_port}:5432 --name postgres-${terraform.workspace} -e POSTGRES_PASSWORD=postgres postgres:15"
  }

}