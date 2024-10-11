data "aws_subnets" "public" {
  depends_on = [aws_subnet.public]
  filter {
    name   = "tag:Name"
    values = ["${var.vpc_name}-public-subnet"]
  }
  tags = {
    Name = "${var.vpc_name}-public-subnet"
  }
}
