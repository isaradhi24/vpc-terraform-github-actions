output "vpc_id" {
    value = aws_vpc.tf_vpc.id
}

output "subnet_ids"{
    value = aws_subnet.subnets.*.id
}

