# Get Availability Zones
resource "tls_private_key" "key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Generate a Private Key and encode it as PEM.
resource "aws_key_pair" "key_pair" {
  key_name   = "key"
  public_key = tls_private_key.key.public_key_openssh

  provisioner "local-exec" {
    command = "echo '${tls_private_key.key.private_key_pem}' > ./sidkey.pem"
  }
}

# Create a EC2 Instance (Ubuntu 20)
resource "aws_instance" "node" {
  instance_type          = "t2.micro" # free instance
  ami                    = "ami-052efd3df9dad4825"
  key_name               = aws_key_pair.key_pair.id
#  vpc_security_group_ids = sg-02b54e9c4f761c8b8
#  subnet_id              = subnet-1f391f40

  tags = {
    Name = "TF Generated EC2"
  }

# user_data = file("${path.root}/ec2/userdata.tpl")

  root_block_device {
    volume_size = 10
  }
}


