resource "aws_instance" "test-blockchain-scn-1-pri-2a" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  availability_zone = "${var.aws_region}a"

  tags = {
    Name = "test-blockchain-scn-1-pri-2a"
  }
}

resource "aws_instance" "test-blockchain-scn-1-pri-2b" {
  ami           = data.aws_ami.amzn2.id
  instance_type = "t2.micro"
  availability_zone = "${var.aws_region}b"

  tags = {
    Name = "test-blockchain-scn-2-pri-2b"
  }
}

# resource "aws_instance" "test-blockchain-scn-3-pri-2c" {
#   ami           = data.aws_ami.amzn2.id
#   instance_type = "t3.xlarge"
#   availability_zone = "${var.aws_region}c"

#   tags = {
#     Name = "test-blockchain-scn-3-pri-2c"
#   }
# }

# resource "aws_instance" "test-blockchain-scn-4-pri-2d" {
#   ami           = data.aws_ami.amzn2.id
#   instance_type = "t3.xlarge"
#   availability_zone = "${var.aws_region}d"

#   tags = {
#     Name = "test-blockchain-scn-4-pri-2d"
#   }
# }