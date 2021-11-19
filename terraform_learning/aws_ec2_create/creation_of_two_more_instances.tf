resource "aws_instance" "myapp-server-2" {
  ami           = data.aws_ami.latest-amazon-linux-image.id
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  key_name                    = var.public_key_name
  # key_name = aws_key_pair.ssh-key.key_name

  user_data = file("script.sh")

  tags = {
    Name = "${var.env_prefix}-myapp-server-2"
  }
}

resource "aws_instance" "myapp-server-3" {
  ami           = data.aws_ami.latest-amazon-linux-image.id
  instance_type = var.instance_type

  subnet_id                   = aws_subnet.myapp-subnet-1.id
  vpc_security_group_ids      = [aws_default_security_group.default-sg.id]
  availability_zone           = var.avail_zone
  associate_public_ip_address = true
  key_name                    = var.public_key_name
  # key_name = aws_key_pair.ssh-key.key_name

  user_data = file("script.sh")

  tags = {
    Name = "${var.env_prefix}-myapp-server-3"
  }
}
