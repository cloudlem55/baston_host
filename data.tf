

data "aws_availability_zones" "available" {}

locals {
  vpc_id        = aws_vpc.main.id
  project       = var.project
  # ami_id        = data.aws_ami.centos.id
  disk_size     = var.disk_size
  subnet_id     = aws_subnet.public.id
  ssh_key       = var.ssh_key
  instance_type = var.instance_type
}