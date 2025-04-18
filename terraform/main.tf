provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source            = "./modules/ec2"
  vpc_id            = module.vpc.vpc_id
  public_subnet_id  = module.vpc.public_subnet_ids[0]
  ami_id            = "ami-03193735e93a78955"  # Example: Ubuntu 22.04 LTS in ap-south-1
}

module "rds" {
  source            = "./modules/rds"
  private_subnet_ids = module.vpc.private_subnet_ids
  db_identifier     = "flask-postgres-db"
  db_username       = "postgres"
  db_password       = "SuperSecure123"
  db_name           = "demo_db"
  vpc_id            = module.vpc.vpc_id	
  security_group_id = module.ec2.security_group_id  # Assuming EC2 SG allows egress
}
