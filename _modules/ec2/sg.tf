resource "aws_security_group" "sonlh-ec2-sg" {
  name        = "${var.ec2_name}-admin-sg"
  description = "sonlh-sg"
  vpc_id      = var.vpc_id
  tags = merge({
    Name = "${var.ec2_name}-admin-sg"
  }, var.tags)
}


resource "aws_security_group_rule" "sg-rule-egress" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  ipv6_cidr_blocks  = null
  prefix_list_ids   = null
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sonlh-ec2-sg.id
}

resource "aws_security_group_rule" "sg-rule-ingress" {
  for_each          = var.trusted_ips
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  ipv6_cidr_blocks  = null
  prefix_list_ids   = null
  cidr_blocks       = [each.value]
  security_group_id = aws_security_group.sonlh-ec2-sg.id
}
