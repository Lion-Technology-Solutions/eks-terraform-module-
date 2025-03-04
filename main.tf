provider "aws" {
  region = "us-east-1"
}

module "eks_cluster" {
  source = "./eks"

  cluster_name    = "my-eks-cluster"
  subnet_ids      = ["subnet-0123456789abcdef0", "subnet-0123456789abcdef1"]
  node_desired_size = 2
  node_max_size     = 3
  node_min_size     = 1
}

output "cluster_name" {
  value = module.eks_cluster.cluster_name
}

output "cluster_endpoint" {
  value = module.eks_cluster.cluster_endpoint
}