output "vpc_id" {
  value = aws_vpc.sonlh-vpc.id
}

output "public_subnet_id" {
  value = data.aws_subnets.public.ids
}
