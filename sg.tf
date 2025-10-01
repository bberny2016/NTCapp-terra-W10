// security group

resource "aws_security_group" "alb_sg" {
  name        = "web-sg"
  description = "Security group with TCP port 80 open"
  vpc_id      = aws_vpc.my-vpc.id


  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web-sg"
  }
}



// security group

resource "aws_security_group" "web1_sg" {
  name        = "web1-sg"
  description = "Security group with TCP port 80 open"
  vpc_id      = aws_vpc.my-vpc.id


  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    //cidr_blocks = ["0.0.0.0/0"]
    security_groups = [aws_security_group.alb_sg.id]
  }


  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "web1-sg"
  }
}