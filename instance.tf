# Bastion
resource "aws_instance" "test-blockchain-bastion-pub-2c" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  availability_zone = "${var.aws_region}c"

  iam_instance_profile = aws_iam_instance_profile.amazon_ec2_role_for_s3_iam.id

  subnet_id = aws_subnet.test-blockchain-en-pub-2c.id
  key_name = "test-bastion"
  associate_public_ip_address = true

  security_groups = [aws_security_group.test-blockchain-bastion-sg.id]

  user_data = templatefile("./userdata/bastion_userdata.sh", { s3_bucket_path = "${var.s3_bucket_path}" })

  tags = {
    Name = "test-blockchain-bastion-pub-2c"
  }
}

# Blockchain SCN Node
resource "aws_instance" "test-blockchain-scn-1-pri-2a" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "${var.scn_type}"
  availability_zone = "${var.aws_region}a"

  iam_instance_profile = aws_iam_instance_profile.amazon_ec2_role_for_s3_iam.id

  subnet_id = aws_subnet.test-blockchain-scn-pri-2a.id
  private_ip = "10.0.5.50"
  key_name = "test-bastion"

  user_data = templatefile("./userdata/scn_userdata.sh", { s3_bucket_path = "${var.s3_bucket_path}" })

  security_groups = [aws_security_group.test-blockchain-sg.id]

  root_block_device {
    volume_type = "${var.scn_volume_type}"
    volume_size = "${var.scn_volume_size}"
  }

  tags = {
    Name = "test-blockchain-scn-1-pri-2a"
  }
}

resource "aws_instance" "test-blockchain-scn-2-pri-2b" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "${var.scn_type}"
  availability_zone = "${var.aws_region}b"

  iam_instance_profile = aws_iam_instance_profile.amazon_ec2_role_for_s3_iam.id

  subnet_id = aws_subnet.test-blockchain-scn-pri-2b.id
  private_ip = "10.0.5.100"
  key_name = "test-bastion"

  user_data = templatefile("./userdata/scn_userdata.sh", { s3_bucket_path = "${var.s3_bucket_path}" })

  security_groups = [aws_security_group.test-blockchain-sg.id]
  root_block_device {
    volume_type = "${var.scn_volume_type}"
    volume_size = "${var.scn_volume_size}"
  }

  tags = {
    Name = "test-blockchain-scn-2-pri-2b"
  }
}

resource "aws_instance" "test-blockchain-scn-3-pri-2c" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "${var.scn_type}"
  availability_zone = "${var.aws_region}c"

  iam_instance_profile = aws_iam_instance_profile.amazon_ec2_role_for_s3_iam.id

  subnet_id = aws_subnet.test-blockchain-scn-pri-2c.id
  private_ip = "10.0.5.150"
  key_name = "test-bastion"

  user_data = templatefile("./userdata/scn_userdata.sh", { s3_bucket_path = "${var.s3_bucket_path}" })

  security_groups = [aws_security_group.test-blockchain-sg.id]
  
  root_block_device {
    volume_type = "${var.scn_volume_type}"
    volume_size = "${var.scn_volume_size}"
  }

  tags = {
    Name = "test-blockchain-scn-3-pri-2c"
  }
}

resource "aws_instance" "test-blockchain-scn-4-pri-2d" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "${var.scn_type}"
  availability_zone = "${var.aws_region}d"

  iam_instance_profile = aws_iam_instance_profile.amazon_ec2_role_for_s3_iam.id

  subnet_id = aws_subnet.test-blockchain-scn-pri-2d.id
  private_ip = "10.0.5.200"
  key_name = "test-bastion"

  user_data = templatefile("./userdata/scn_userdata.sh", { s3_bucket_path = "${var.s3_bucket_path}" })

  security_groups = [aws_security_group.test-blockchain-sg.id]
  
  root_block_device {
    volume_type = "${var.scn_volume_type}"
    volume_size = "${var.scn_volume_size}"
  }

  tags = {
    Name = "test-blockchain-scn-4-pri-2d"
  }
}

# Security Groups
resource "aws_security_group" "test-blockchain-bastion-sg" {
  name        = "test-blockchain-bastion-sg"
  description = "Allow Bastion inbound traffic"
  vpc_id      = aws_vpc.test-blockchain-vpc.id

  ingress {
    description      = "Allow SSH from Anywhere"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "test-blockchain-bastion-sg"
  }
}

resource "aws_security_group" "test-blockchain-sg" {
  name        = "test-blockchain-sg"
  description = "Allow scn inbound traffic"
  vpc_id      = aws_vpc.test-blockchain-vpc.id

  ingress {
    description      = "Allow SSH from Blockchain vpc"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.test-blockchain-vpc.cidr_block]
  }

  ingress {
    description      = "Allow All traffic from Blockchain vpc"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.test-blockchain-vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "test-blockchain-sg"
  }
}