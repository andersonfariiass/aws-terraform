#Create resource Load Balace

resource "aws_elb" "loadb" {
    name_prefix = "loadb"
    availability_zones = ["us-east-1a", "us-east-1c"]
    subnets = ["${aws_subnet.main-public-1.id}", "${aws_subnet.main-public-2.id}"]
    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 2
        timeout = 3
        target = "HTTP:80/"
        interval = 30
    }

    listener {
        instance_port = 80
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }
    cross_zone_load_balancing = true
    instances = ["${aws_instance.vm-cloud.id}","${aws_instance.vm-cloud2.id}"]
    security_groups = ["${aws_security_group.access-web.id}"]
}
