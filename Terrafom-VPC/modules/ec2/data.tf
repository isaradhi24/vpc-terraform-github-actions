data "aws_ami" "amazon-2" {
  most_recent = true
  owners      = ["amazon"] # Specifies that the AMI is owned by Amazon

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"] # Filters for Amazon Linux 2 HVM AMIs, x86_64 architecture, and gp2 root volume
  }

    filter {
    name   = "virtualization-type"
    values = ["hvm"] # Filters for Hardware Virtual Machine (HVM) virtualization type
  }
}

data "aws_availability_zones" "available" {
  state = "available"
}