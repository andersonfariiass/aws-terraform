#Create resource instace
resource "aws_instance" "vm-cloud" {
    ami = "ami-0ac019f4fcb7cb7e6"
    instance_type = "t2.micro"
    #Escreva o nome da sua chave
    key_name = "access-cloudjob"
    subnet_id = "${aws_subnet.main-public-1.id}"
    vpc_security_group_ids = ["${aws_security_group.access-remote.id}","${aws_security_group.access-web.id}"]
    associate_public_ip_address = "true"
    tags {
        Name = "Infra as Code"
        Projeto = "Projeto AWS + Terraform"
        Github = "https://github.com/andersonfariiass/aws-terraform/"
    }
}

resource "aws_instance" "vm-cloud2" {
    ami = "ami-0ac019f4fcb7cb7e6"
    instance_type = "t2.micro"
    key_name = "access-cloudjob"
    subnet_id = "${aws_subnet.main-public-2.id}"
    vpc_security_group_ids = ["${aws_security_group.access-remote.id}","${aws_security_group.access-web.id}"]
    associate_public_ip_address = "true"
    tags {
        Name = "Infra as Code"
        Projeto = "Projeto AWS + Terraform"
        Github = "https://github.com/andersonfariiass/aws-terraform/"
    }
}

#Output public IP and DNS

output "aws_ip_vm1" {
    value = "${aws_instance.vm-cloud.public_ip}"
}

output "aws_dns_vm1" {
    value = "${aws_instance.vm-cloud.public_dns}"
}

output "aws_ip_vm2" {
    value = "${aws_instance.vm-cloud2.public_ip}"
}

output "aws_dns_vm2" {
    value = "${aws_instance.vm-cloud2.public_dns}"
}
