data "aws_ami" "dev_server_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu-eks-pro/k8s_1.33/images/hvm-ssd-gp3/ubuntu-noble-24.04-arm64-server-*"]
  }
}
