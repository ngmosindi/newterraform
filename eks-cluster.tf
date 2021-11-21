data "aws_eks_cluster" "cluster" {
  name = module.ng-cluster.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.ng-cluster.cluster_id
}


module "ng-cluster" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "sophya-cluster"
  cluster_version = "1.14"
  subnets         = module.vpc.private_subnets
  vpc_id          = module.vpc.vpc_id

  worker_groups = [
    {
      instance_type = "t3.medium"
      asg_max_size  = 3
    }
  ]
}