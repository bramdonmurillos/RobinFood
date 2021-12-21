provider "aws" {
  region = "us-east-2"
}

resource "aws_launch_configuration" "app" {
  name_prefix   = var.name_prefix
  image_id      = var.ami_id
  instance_type = var.instance_type
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "scale" {
  name                 = var.autoscaling_name
  launch_configuration = "${aws_launch_configuration.app.name}"
  min_size             = var.min_size
  max_size             = var.max_size
  availability_zones = var.availability_zones
  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"


  ingress {
    description      = "ssh"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.main.cidr_block]
    ipv6_cidr_blocks = [aws_vpc.main.ipv6_cidr_block]
  }

  tags = {
    Name = "allow_tls"
  }
}
resource "aws_instance" "ansible" {
  ami           = "ami-xxxxxx"
  instance_type = "t2.micro"
  security_groups = ["$[aws_security_group.allow_ssh.name]"]

  tags = {
    Name = "ansible-vm"
  }
}