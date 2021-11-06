data "aws_eks_cluster" "myapp-eks" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "myapp-eks" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.myapp-eks.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.myapp-eks.certificate_authority[0].data)
  token                  = data.aws_eks_cluster_auth.myapp-eks.token
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "17.23.0"

  cluster_version = "1.21"
  cluster_name    = "myapp-eks-cluster"
  vpc_id          = module.myapp-vpc.vpc_id
  subnets         = module.myapp-vpc.private_subnets

  tags = {
    environment = "development"
    app         = "myapp"
  }

  worker_groups = [
    {
      instance_type        = "t2.micro"
      name                 = "worker_group-1"
      asg_desired_capacity = 3
    }
  ]
}
