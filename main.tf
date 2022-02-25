# What is the `data` keyword?
# It is used for looking up a Datasource.
# It is used to lookup data against the infrastrucure provider (ex. AWS)

data "aws_ami" "yw_ubuntu_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

# Create a new instance of the latest Ubuntu 20.04 on an 
# t3.micro node with an AWS Tag name

resource "aws_instance" "web" {
  ami           = data.aws_ami.yw_ubuntu_ami.id
  instance_type = var.ec2_instance_type

  tags = {
    Name = var.ec2_instance_tag_name
  }
}