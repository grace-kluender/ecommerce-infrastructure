## Terraform State Backup

Terraform state files are stored locally in the `terraform-state` directory and workspace-specific folders in `terraform.tfstate.d`.

To prevent loss of infrastructure configuration, state files should be backed up regularly.

Recommended backup procedure:
1. Copy the `terraform-state` directory to secure storage.
2. Store backups in versioned cloud storage (e.g., S3, Google Drive).
3. Do not commit `.tfstate` files to Git.

Example backup command:

cp -r terraform-state backups/terraform-state-$(date +%Y%m%d)

## Retrieving Terraform Outputs for CI/CD

Terraform outputs can be retrieved using:

terraform output

Example output:

jenkins_url = http://localhost:8080
kubernetes_namespace = dev
postgres_port = 5433

These values can be consumed by CI/CD pipelines such as Jenkins to configure deployments and environment connections.