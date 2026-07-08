
module "network" {
  source   = "git::https://github.com/DiscipleOfKabr/aws-vpc-backbone//modules/vpc"
  env_name = "agones-dev"
  vpc_cidr = "10.1.0.0/16"

  subnet_configs = {
    public_1a  = { cidr = "10.1.1.0/24", az = "eu-central-1a", type = "public", nat_gw = true }
    public_1b  = { cidr = "10.1.2.0/24", az = "eu-central-1b", type = "public", nat_gw = true }
    private_1a = { cidr = "10.1.3.0/24", az = "eu-central-1a", type = "private", nat_gw = false }
    private_1b = { cidr = "10.1.4.0/24", az = "eu-central-1b", type = "private", nat_gw = false }
  }
}


#EKS module that connects to the aws-vpc-backbone
module "eks" {

  source   = "../../modules/eks"
  env_name = "agones-dev"


  private_subnet_ids = module.network.private_subnet_ids
}