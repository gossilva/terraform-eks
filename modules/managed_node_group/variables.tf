variable "project_name" {
  type        = string
  description = "Default naming convention for EKS cluster resources"
}

variable "tags" {
  type        = map(any)
  description = "Tags to be added to AWS resources"
}

variable "cluster_name" {
  type        = string
  description = "Cluster name to be referenced in node group creation"
}

variable "private_subnet_1a" {
  type        = string
  description = "Subnet ID from AZ 1a"
}

variable "private_subnet_1b" {
  type        = string
  description = "Subnet ID from AZ 1b"
}