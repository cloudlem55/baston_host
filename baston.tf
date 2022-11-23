//creating aws key pair
resource "aws_key_pair" "deployer" {
  key_name   = var.ssh_key
  //use your public key
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDrPLvS/DQHk3qwc/x/pKDWSUXcE1kFARmWAeZofpCWu2kSV+0cQKHqgHdXnufg2+9ExNF4xbQwAoQMGdr4fizuRcIpmJVFrWP1GNpYtRNWBqTcaoeCEW1bNGcUTmbb6jCKbSDgvMaL2vnZjKu5NRRw6y8a19OqEMtfkbITwu+kC0d9hcttnVNO803T6ioTYwngq6QszDtPtYkDjl2Rg8nuuE6xeTb8Hsk6Zgx262wEderyAH8WfkvT+zismb/U4GarJmPkBKWeqd7sLAZpbrsR4NN4hoG4kEURjCSNCROLLka/LjPf+M8GTIh/2o9IN61k2Ae+wMcMeO3Slvj6ou1LM99sgIDrbsOfIf/04z0RnG2D4tlJhUMQpvJip+qg+rTd1dPsgTeSfZX1cREPuIUXNzcWJZU/ZA5VrZ/YNx+4GmUxqtNL6s8Hq5yLxpcecXoNpSrh1HKGQJ7LoBMAbj5E/K1V5HHVvq1tmFrI+ILBFBuLS8io9IOb0NulZwhP/fk= nodejs@nodejs-HP-ProBook-640-G1"
}

resource "aws_instance" "server" {
  ami                         = "ami-08c40ec9ead489470" // change the ami
  instance_type               = local.instance_type
  key_name                    = aws_key_pair.deployer.id
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ingress-all-test.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size           = local.disk_size
    delete_on_termination = true
  }

  lifecycle {
    ignore_changes = [ami]
  }

  tags = {
    Name    = "Bastion host"
    Project = local.project
  }
}