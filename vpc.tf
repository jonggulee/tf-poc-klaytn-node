resource "aws_vpc" "test-blockchain-vpc" {
  cidr_block			= "10.0.0.0/16"
  instance_tenancy		= "default"
  enable_dns_hostnames	= true

  tags = {
    Name = "test-blockchain-vpc"
  }
}

resource "aws_subnet" "test-blockchain-en-pub-2a" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "ap-northeast-2a"
  map_public_ip_on_launch	= true

  tags = {
    Name = "test-blockchain-en-pub-2a"
  }
}

resource "aws_subnet" "test-blockchain-en-pub-2c" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.0.128/26"
  availability_zone = "ap-northeast-2c"
  map_public_ip_on_launch	= true

  tags = {
    Name = "test-blockchain-en-pub-2c"
  }
}

resource "aws_subnet" "test-blockchain-sen-pri-2a" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.1.0/26"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "test-blockchain-sen-pri-2a"
  }
}

resource "aws_subnet" "test-blockchain-sen-pri-2c" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.1.128/26"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "test-blockchain-sen-pri-2c"
  }
}

resource "aws_subnet" "test-blockchain-scn-pri-2a" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.5.0/26"
  availability_zone = "ap-northeast-2a"

  tags = {
    Name = "test-blockchain-scn-pri-2a"
  }
}

resource "aws_subnet" "test-blockchain-scn-pri-2b" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.5.64/26"
  availability_zone = "ap-northeast-2b"

  tags = {
    Name = "test-blockchain-scn-pri-2b"
  }
}

resource "aws_subnet" "test-blockchain-scn-pri-2c" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.5.128/26"
  availability_zone = "ap-northeast-2c"

  tags = {
    Name = "test-blockchain-scn-pri-2c"
  }
}

resource "aws_subnet" "test-blockchain-scn-pri-2d" {
  vpc_id     = aws_vpc.test-blockchain-vpc.id
  cidr_block = "10.0.5.192/26"
  availability_zone = "ap-northeast-2d"

  tags = {
    Name = "test-blockchain-scn-pri-2d"
  }
}

resource "aws_internet_gateway" "test-blockchain-igw" {
  vpc_id = aws_vpc.test-blockchain-vpc.id

  tags = {
    Name = "test-blockchain-igw"
  }
}

resource "aws_eip" "test-blockchain-nat-eip" {
  vpc      = true
  
  tags = {
    Name = "test-blockchain-nat-eip"
  }
}

resource "aws_nat_gateway" "test-blockchain-nat" {
  allocation_id = aws_eip.test-blockchain-nat-eip.id
  subnet_id     = aws_subnet.test-blockchain-en-pub-2a.id

  tags = {
    Name = "test-blockchain-nat-2a"
  }
}
