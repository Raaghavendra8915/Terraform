terraform {
    required_version = ">= 1.2.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }
}
  

provider "aws" {
  region  = "us-west-2"
}

resource "aws_instance" "example_server" {
  ami           = "ami-0e94b676f87d00cea" // ami-id
  instance_type = "t2.micro"
  key_name = "Pixie" //key pair used to connect to instace
  user_data = file("${path.module}/app1-install.sh")   //used to call the local file to execute while creating the instace

  tags = {
    Name = "JacksBlogExample"
  }
}
