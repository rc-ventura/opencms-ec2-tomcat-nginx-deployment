
# Instances
resource "aws_instance" "ec2-postgres-nginx-opencms"{
    instance_type = "t2.micro"
    ami = "ami-053b0d53c279acc90"
    key_name = aws_key_pair.terraform_aws_auth.id
    vpc_security_group_ids = [aws_security_group.main_security_group.id]
    subnet_id = aws_subnet.main_public_subnet.id
    user_data = "userdata.tpl"

    
  root_block_device {
    volume_size = 20

  }

  network_interface {
    network_interface_id = aws_network_interface.ec2-cluster-ip.id
    device_index         = 0
  }



 provisioner "local-exec" {
    command = templatefile("linux-ssh-config.tpl", {
      hostname     = self.public_ip,
      user         = "ubuntu",
      identityfile = "~/.ssh/terraform_aws_key"
    })
  }

   tags = {
    "Name" = "ec2-${var.project}"
    "Environment" = var.env
  }

}

#SSH Key
resource "aws_key_pair" "terraform_aws_auth" {
  key_name   = "terraform_aws_key"
  public_key = file("~/.ssh/terraform_aws_key.pub")
}


############################################################

# Network

#VPC
resource "aws_vpc" "main_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    "Name" = "vpc-${var.project}"
    "Environment" = var.env
  }
}

#Subnet
resource "aws_subnet" "main_public_subnet" {
  vpc_id                  = aws_vpc.main_vpc.id
  cidr_block              = "10.0.0.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "subnet-${var.project}"
    Environment = var.env
  }
}

#Interface Ip Privates
resource "aws_network_interface" "ec2-cluster-ip" {
  subnet_id   = aws_subnet.main_public_subnet.id
  private_ips = ["10.0.0.100"]

  tags = {
    "Name" = "ec2-${var.project}-primary_network_interface"
    "Environment" = var.env
  }
}

#SG
resource "aws_security_group" "main_security_group" {
  name        = "dynamic-dev_sg"
  description = "Allow inbound and outbound traffic with limits rules"
  vpc_id      = aws_vpc.main_vpc.id

  dynamic "ingress" {
    for_each = var.sg_ingress_ports
    content {
      description = " Allow only SSH to the VPC"
      from_port   = ingress.value 
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
  }
    dynamic "egress" {
        for_each = var.sg_egress_ports
    content {
            description      = "No limit outbound traffic"
            from_port        = egress.value
            to_port          = egress.value
            protocol         = "tcp"
            cidr_blocks      = ["0.0.0.0/0"]
            ipv6_cidr_blocks = ["::/0"]
  }
  }

  tags = {
     "Name" = "${var.project}-dynamic-sg"
     "Environment" =  var.env
    
  }


}
#IGW
resource "aws_internet_gateway" "main_internet_gateway" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${var.project}-internet_gateway"
    "Environment" = var.env
  }
}

#Table route
resource "aws_route_table" "main_public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    "Name" = "${var.project}-route_table"
    "Environment" = var.env
  }

}

#Routes
resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.main_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.main_internet_gateway.id

}

#Table Association
resource "aws_route_table_association" "main_public_association" {
  subnet_id      = aws_subnet.main_public_subnet.id
  route_table_id = aws_route_table.main_public_rt.id

}

     


