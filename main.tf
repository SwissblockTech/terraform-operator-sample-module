variable "PROJECT_ID" {
  description = "GCP Project ID"
  type        = string
  # default     = "TypeHere"
}

provider "google" {
    project   = var.PROJECT_ID
}

resource "google_service_account" "terraform_operator_editor" {
  account_id     = "tf-editor"
  display_name   = "Service Account created by Terraform K8s Operator"
}

resource "google_project_iam_member" "terraform_operator_editor_binding" {
  project   = var.PROJECT_ID
  role      = "roles/editor"
  member    = "serviceAccount:${google_service_account.terraform_operator_editor.email}"
}

resource "google_service_account" "terraform_operator_viewer" {
  account_id     = "tf-viewer"
  display_name   = "Service Account created by Terraform K8s Operator"
}

resource "google_project_iam_member" "terraform_operator_viewer_binding" {
  project   = var.PROJECT_ID
  role      = "roles/viewer"
  member    = "serviceAccount:${google_service_account.terraform_operator_viewer.email}"
}
