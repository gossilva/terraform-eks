variable "project_name" {
  type        = string
  description = "Default naming convention for EKS cluster resources"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}
variable "oidc" {
  type        = string
  description = "HTTPS URL from OIDC provider of the EKS cluster"
}