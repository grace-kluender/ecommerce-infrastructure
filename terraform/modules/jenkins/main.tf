resource "null_resource" "jenkins" {

  provisioner "local-exec" {
    command = "docker run -d -p ${var.jenkins_port}:8080 --name jenkins-${terraform.workspace} jenkins/jenkins:lts"
  }

}