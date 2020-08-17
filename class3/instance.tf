resource "aws_instance" "web" {
  ami                         = "${data.aws_ami.centos.id}"
  instance_type               = "t2.micro"
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.class.key_name}"

  user_data              = "${file("userdata.sh")}"
  vpc_security_group_ids = ["${aws_security_group.provisioner.id}"]
 
  tags = {
    name = "userdata"
  }
}
