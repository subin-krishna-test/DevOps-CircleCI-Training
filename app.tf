#EC2 instance-1
resource "aws_instance" "Server-1" {
  ami           = "ami-00399ec92321828f5" 
  instance_type = "t2.micro"
  #key_name = "Server 1 Key"

  tags = {
    Name = "Server-1"
  }
  user_data = <<EOF
#! /bin/bash
sudo apt-get update -y 
sudo apt install nginx -y 
echo "<h1>Server-1</h1>" | sudo tee /var/www/html/index.html
sudo systemctl restart nginx
EOF
#security_groups = [aws_security_group.Security_group_instance.name]
}

#EC2 instance-2              
resource "aws_instance" "Server-2" {
  ami           = "ami-00399ec92321828f5"
  instance_type = "t2.micro"
  #key_name = "Server 2 Key"

  tags = {
    Name = "Server-2"
  }
  user_data = <<EOF
#! /bin/bash
sudo apt-get update -y 
sudo apt install nginx -y 
echo "<h1>Server-2</h1>" | sudo tee /var/www/html/index.html
sudo systemctl restart nginx
EOF
#security_groups = [aws_security_group.Security_group_instance.name]
}
/*
#Security Group for EC2 instance
resource "aws_security_group" "Security_group_instance" {
  name        = "Instance Security Group"
  description = "ssh and http"


  ingress = [
    {
      description      = "SSH from VPC"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups = []
      prefix_list_ids = []
      self = false
      
      
    },

    {
      description      = "http from VPC"
      from_port        = 80
      to_port          = 80
      protocol         = "tcp"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups = []
      prefix_list_ids = []
      self = false
      
      
    }
  ]

  egress = [
    {
      description      = "Outbound rules"
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      security_groups = []
      prefix_list_ids = []
      self = false
      
    }
  ]

  tags = {
    Name = "Instance_Security_Group1"
  }
}*/