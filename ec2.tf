// ec2 servers

resource "aws_instance" "webserver1" {
  instance_type          = "t3.micro"
  ami                    = "ami-08982f1c5bf93d976"
  user_data              = file("setup.sh")
  subnet_id              = aws_subnet.private1.id
  vpc_security_group_ids = [aws_security_group.web1_sg.id]

  tags = {
    Name = "webserver-1"
    Env  = "dev"
  }
}

resource "aws_instance" "webserver2" {
  instance_type          = "t3.micro"
  ami                    = "ami-08982f1c5bf93d976"
  user_data              = file("setup.sh")
  subnet_id              = aws_subnet.private2.id
  vpc_security_group_ids = [aws_security_group.web1_sg.id]

  tags = {
    Name = "webserver-2"
    Env  = "dev"
  }
}