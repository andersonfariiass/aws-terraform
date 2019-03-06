#Create resource instace
resource "aws_instance" "vm-cloud" {
    ami = "ami-0ac019f4fcb7cb7e6"
    instance_type = "t2.micro"
    key_name = "access-cloudjob"
    subnet_id = "${aws_subnet.main-public-1.id}"
    vpc_security_group_ids = ["${aws_security_group.access-remote.id}"]
    associate_public_ip_address = "true"
}
