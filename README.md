## Overview
This repository contains Terraform configurations used to provision local infrastructure for the e-commerce microservices system. The repository also includes a Docker Compose configuration used to run supporting local development services

The infrastructure includes:
- Minikube Kubernetes cluster
- PostgreSQL database container
- Jenkins CI/CD server
- Kubernetes namespaces for environment isolation

---

# Terraform Modules

Terraform modules are used to organize infrastructure components.

Modules are located in:

```
terraform/modules
```

Modules implemented:

| Module | Purpose |
|------|------|
| minikube | Starts and configures the local Kubernetes cluster |
| postgres | Runs a PostgreSQL container for application data |
| jenkins | Deploys a Jenkins CI/CD server container |
| dev-env | Creates Kubernetes namespaces for environment isolation |

Each module contains:

```
main.tf
variables.tf
outputs.tf
```

---

# Terraform Workspaces

Terraform workspaces are used to manage multiple environments from the same Terraform configuration.

Environments implemented:

| Workspace | Purpose |
|------|------|
| dev | Development environment |
| staging | Pre-production testing |
| prod | Production configuration |

Each workspace maintains its own Terraform state file to prevent environment conflicts.

---

# Local State Management

Terraform state is managed using a local backend, which stores the infrastructure state on the local machine. The state file keeps track of the resources Terraform manages and ensures that infrastructure changes are applied consistently.

The project uses a local backend defined in `backend.tf`. This backend stores Terraform state locally. While the local backend does not support distributed state locking, it is sufficient for single-user development environments.

State files are stored locally in:

```
terraform.tfstate.d/
terraform-state/
```

Each workspace has its own state directory:

```
terraform.tfstate.d/dev
terraform.tfstate.d/staging
terraform.tfstate.d/prod
```

State files are excluded from version control using `.gitignore`.

---

# State Backup Procedures

Terraform state files represent the current infrastructure configuration and should be backed up regularly to prevent data loss.

Recommended backup procedure:

1. Copy the Terraform state directory.
2. Store the backup in secure storage.
3. Maintain timestamped backups for recovery.

Example backup command:

```bash
cp -r terraform.tfstate.d backups/terraform-state-$(date +%Y%m%d)
```

---

# Terraform Outputs for CI/CD

Terraform outputs provide infrastructure values that can be used by CI/CD pipelines.

Defined outputs include:

- `jenkins_url`
- `kubernetes_namespace`
- `postgres_port`
- `minikube_cluster`
- `docker_registry`

Outputs can be retrieved with:

```bash
terraform output
```

Example output:

```
docker_registry = "docker.io/gracekluender"
jenkins_url = http://localhost:8080
kubernetes_namespace = dev
postgres_port = 5433
minikube_cluster = Minikube running
```

These outputs can be used by Jenkins pipelines to configure deployments.

---

# Infrastructure Deployment Workflow

Typical Terraform workflow:

Initialize Terraform:

```bash
terraform init
```

Select environment:

```bash
terraform workspace select dev
```

Plan infrastructure:

```bash
terraform plan -var-file=dev.tfvars
```

Apply infrastructure:

```bash
terraform apply -var-file=dev.tfvars
```

---
