provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "myec2" {
    ami           = "ami-0c55b159cbfafe1f0"
    instance_type =  "t3.micro"
    tags = {
    Name = "Jenkins-Terraform-App"
  }
   user_data = <<-EOF
    #!/bin/bash
    sudo yum update -y
    sudo yum install docker -y
    sudo service docker start
    sudo usermod -aG docker ec2-user
    docker run -d -p 80:5000 mydockerhubusername/myapp:latest
  EOF
}
