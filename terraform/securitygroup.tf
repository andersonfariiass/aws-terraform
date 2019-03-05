#Create resource Security Group

resource "aws_security_group" "access-remote" {
    name = "access-remote"
    vpc_id = "${aws_vpc.main.id}"
    description "Libera acesso remote via SSH e RDP"
    ingress {
       from_port = 22
       to_port = 22
       protocol = "tcp"
       cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = 3389
        to_port = 3389
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags {
        Name = "access-remote"
    }
}
