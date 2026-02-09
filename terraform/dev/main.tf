resource "aws_instance" "dev_server" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = aws_subnet.dev_private_subnet.id  # Launch in private subnet

  tags = {
    Name = var.instance_name
    Env  = "dev"
  }
}
