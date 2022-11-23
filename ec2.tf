


resource "aws_instance" "myServerEc2" {
  ami                         = "ami-08c40ec9ead489470" //change the ami 
  instance_type               = local.instance_type
  key_name                    = aws_key_pair.deployer.id
  subnet_id                   = aws_subnet.private.id
  vpc_security_group_ids      = [aws_security_group.ingress-all-test.id]
  associate_public_ip_address = false

  root_block_device {
    volume_size           = local.disk_size
    delete_on_termination = true
  }

  lifecycle {
    ignore_changes = [ami]
  }

  tags = {
    Name    = "Ec2-INST"
    Project = local.project
  }
}