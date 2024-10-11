resource "random_integer" "this" {
  min = 10000000
  max = 99999999
}
locals {
  identify = random_integer.this.result
}

resource "aws_key_pair" "sonlh-ec2-keypair" {
  key_name   = "${var.ec2_name}-${local.identify}"
  public_key = var.ec2_public_key
  tags       = var.tags
}

#Create EC2 instance
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name                        = var.ec2_name
  associate_public_ip_address = var.associate_public_ip_address
  ami                         = var.ami
  instance_type               = var.instance_type
  key_name                    = aws_key_pair.sonlh-ec2-keypair.key_name
  monitoring                  = var.ec2_monitoring
  vpc_security_group_ids      = [aws_security_group.sonlh-ec2-sg.id]
  subnet_id                   = var.subnet_id
  user_data_base64            = var.user_data_base64

  volume_tags = var.tags
  tags        = var.tags
}
