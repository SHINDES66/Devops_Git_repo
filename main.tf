terraform {
  required_providers {

    aws = {
source = "hashicorp/aws"
version = "5.5.0"

    }
  }

}

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
instance_type = "t2.medium"
ami = data.aws_ami.app_ami.id


tags = {
Name = "import"
}

}


resource "aws_instance" "my-ec2-pol" {

instance_type= "t2.medium"
ami = data.aws_ami.app_ami.id

tags = {
Name = "Poll"
}

}

data "aws_ami" "app_ami" {
owners = ["amazon"]
most_recent = true


filter {
name = "name"
values = ["amzn2-ami-kernel-5.10**"]

}
}
