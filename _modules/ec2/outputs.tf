output "ec2_key_pair_name" {
  value = aws_key_pair.sonlh-ec2-keypair.key_name
}

output "ec2_public_ip" {
  value = module.ec2_instance.public_ip
}
