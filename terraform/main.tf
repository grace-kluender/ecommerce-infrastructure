module "minikube" {

  source = "./modules/minikube"

  cpu    = var.minikube_cpu
  memory = var.minikube_memory
}

module "postgres" {

  source = "./modules/postgres"

  db_port = var.db_port
}

module "jenkins" {

  source = "./modules/jenkins"

  jenkins_port = var.jenkins_port
}

module "dev_environment" {

  source = "./modules/dev-env"

  namespace = var.k8s_namespace
}