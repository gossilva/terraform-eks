module "eks_network" {
  source       = "./modules/network"
  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}

module "eks_cluster" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_public_1a
  public_subnet_1b = module.eks_network.subnet_public_1b
}

module "managed_node_group" {
  source            = "./modules/managed_node_group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  private_subnet_1a = module.eks_network.subnet_private_1a
  private_subnet_1b = module.eks_network.subnet_private_1b
  tags              = local.tags
}

module "aws_load_balancer_controller" {
  source       = "./modules/aws_load_balancer_controller"
  project_name = var.project_name
  tags         = local.tags
  oidc         = module.eks_cluster.oidc
  cluster_name = module.eks_cluster.cluster_name
}