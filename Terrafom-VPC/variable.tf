variable "vpc_cidr" {
    description = "VPC CIDR Range"
    type = string    
}
variable "subnet_cidr" {
    description = "CIDR for Subnets"
    type = list(string)
}
