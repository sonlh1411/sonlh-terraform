locals {
  #calculate available zones of aws provider
  az_counts = 2
}

#Calling module network to create vpc
module "vpc" {
  source    = "./_modules/network"
  az_counts = local.az_counts
  azname    = data.aws_availability_zones.available.names
}

#Calling module ec2 to create ec2 instance
module "ec2" {
  depends_on                  = [module.vpc]
  source                      = "./_modules/ec2"
  for_each                    = var.ec2
  ec2_name                    = each.value.ec2_name
  ami                         = each.value.ami
  instance_type               = each.value.instance_type
  tags                        = merge(each.value.ext-tags, var.tags)
  subnet_id                   = module.vpc.public_subnet_id[0]
  vpc_id                      = module.vpc.vpc_id
  ec2_public_key              = each.value.ec2_public_key
  associate_public_ip_address = each.value.associate_public_ip_address
  trusted_ips                 = toset(each.value.trusted_ips)
  user_data_base64            = each.value.user_data_base64
  ec2_monitoring              = each.value.ec2_monitoring
}
