variable "key_pair" {
  default = "aws-key"
}
resource "aws_instance" "tf-server" {
  ami = "ami-0ce21b51cb31a48b8"
  instance_type = "t2.micro"
  subnet_id = "${module.aws-network-configs.public-a-id}"
  vpc_security_group_ids = ["${module.aws-network-configs.tf-sg-id}"]
  key_name = "${var.key_pair}"
  count = 1
  tags = {
    Name = "terraform-instance"
  }
  associate_public_ip_address = true
}