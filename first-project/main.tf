resource "aws_vpc" "dev_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true

  tags = {
    Name = "dev"
  }

}

resource "aws_subnet" "dev_public_subnet" {
  vpc_id                  = aws_vpc.dev_vpc.id
  cidr_block              = "10.0.0.0/16"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "dev_public_subnet"
  }
}

resource "aws_internet_gateway" "dev_internet_gateway" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "dev_igw"
  }
}

resource "aws_route_table" "dev_public_rt" {
  vpc_id = aws_vpc.dev_vpc.id

  tags = {
    Name = "dev_public_rt"
  }
}

resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.dev_public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.dev_internet_gateway.id
}

resource "aws_route_table_association" "dev_public_assoc" {
  subnet_id      = aws_subnet.dev_public_subnet.id
  route_table_id = aws_route_table.dev_public_rt.id
}

resource "aws_security_group" "dev_sg" {
  name        = "dev_sg"
  description = "dev security group"
  vpc_id      = aws_vpc.dev_vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["100.2.82.208/32"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_key_pair" "jubran_auth" {
  key_name   = "jubran_key"
  public_key = file("/mnt/workspace/jubran-dev-key.pub")
}

resource "aws_instance" "jubran_dev_node" {
  instance_type = "t2.micro"
  ami           = data.aws_ami.dev_server_ami.id

  key_name = aws_key_pair.jubran_auth.id

  vpc_security_group_ids = [aws_security_group.dev_sg.id]

  subnet_id = aws_subnet.dev_public_subnet.id
  user_data = file("userdata.tpl")

  root_block_device {
    volume_size = 10
  }


  tags = {
    Name = "jubran_dev_node"
    Test = "test"
  }
} 


