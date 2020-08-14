resource "aws_route53_record" "class2" {
  zone_id = "Z1022805K2HM8ZNDKTKM"
  name    = "class2.devopsplus.net"
  type    = "A"
  ttl     = "30"
  records = ["${aws_instance.web.public_ip}"]
}

