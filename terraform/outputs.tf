output "minikube_cluster" {
  value = module.minikube.minikube_status
}

output "postgres_port" {
  value = module.postgres.postgres_port
}

output "jenkins_url" {
  value = module.jenkins.jenkins_url
}

output "kubernetes_namespace" {
  value = module.dev_environment.namespace
}