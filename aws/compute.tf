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
  #checkov:skip=CKV2_AWS_41:Tutorial EC2 instance does not require AWS API access; assigning an IAM role would grant unnecessary credentials.
  #checkov:skip=CKV_AWS_88:Tutorial instance intentionally has a public IPv4 address for direct SSH; ingress is restricted to the administrator's /32 address.
  #checkov:skip=CKV_AWS_126:Detailed EC2 monitoring is intentionally omitted from this low-cost tutorial environment.
  ami                         = data.aws_ssm_parameter.amazon_linux_2023.value
  instance_type               = "t3.micro"
  ebs_optimized               = true
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.ec2.id]
  key_name                    = aws_key_pair.tutorial.key_name
  associate_public_ip_address = true

  root_block_device {
    encrypted   = true
    volume_type = "gp3"
  }

  metadata_options {
    http_endpoint = "enabled"
    http_tokens   = "optional"
  }

  tags = {
    Name        = "tutorial-ec2"
    Description = "My first Terraform EC2 instance"
    ChangeTest  = "ViaPullRequest"
  }
}