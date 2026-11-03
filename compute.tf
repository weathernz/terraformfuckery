data "aws_ssm_parameter" "amazon_linux_2023" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

resource "aws_key_pair" "tutorial" {
  key_name   = "terraform-tutorial-key"
  public_key = file("${path.module}/tutorial-key.pub")

  tags = {
    Name = "terraform-tutorial-key"
  }
}

resource "aws_instance" "tutorial" {
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = "t3.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  key_name                    = aws_key_pair.tutorial.key_name
  associate_public_ip_address = true

  tags = {
    Name        = "tutorial-ec2"
    Description = "My first Terraform EC2 instance"
    ChangeTest  = "ViaPullRequest"
  }
}