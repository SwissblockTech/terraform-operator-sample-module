variable "PROJECT_ID" {
  description = "GCP Project ID"
  type        = string
  # default     = "TypeHere"
}

provider "google" {
    project   = var.PROJECT_ID
}

resource "google_service_account" "terraform_operator_sample" {
  account_id     = "terraform-operator-sample"
  display_name   = "Service Account created by Terraform K8s Operator"
}

resource "google_project_iam_member" "terraform_operator_sample_binding" {
  project   = var.PROJECT_ID
  role      = "roles/editor"
  member    = "serviceAccount:${google_service_account.terraform_operator_sample.email}"
}

resource "google_service_account" "terraform_operator_another_sample" {
  account_id     = "terraform-operator-another-sample"
  display_name   = "Another Service Account created by Terraform K8s Operator"
}

resource "google_project_iam_member" "terraform_operator_another_sample_binding" {
  project   = var.PROJECT_ID
  role      = "roles/viewer"
  member    = "serviceAccount:${google_service_account.terraform_operator_another_sample.email}"
}
