resource "aws_instance" "master_server" {
  count                  = var.number_of_instances
  ami                    = data.aws_ami.ubuntu_image.id
  instance_type          = var.ec2_type
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [aws_security_group.my_public_app_sg.id]
  key_name               = var.my_keypair
  private_ip             = "192.168.1.51"
  root_block_device {
    volume_size = 100
  }

  tags = {
    Name = "reggie_uds_core_server"
  }
}