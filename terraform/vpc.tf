#Create resource VPC

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/24"
    instance_tenancy = "default"
    enable_dns_support = "true"
    enable_dns_hostname = "true"
    enable_classiclink = "false"
    tags{
        Name = "main"
    }
}
