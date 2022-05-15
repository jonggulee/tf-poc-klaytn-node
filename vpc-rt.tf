resource "aws_route_table" "test-blockchain-en-rt" {
  vpc_id = aws_vpc.test-blockchain-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.test-blockchain-igw.id
  }

  tags = {
    Name = "test-blockchain-en-rt"
  }
}

resource "aws_route_table_association" "test-blockchain-en-pub-2a-rt" {
  subnet_id      = aws_subnet.test-blockchain-en-pub-2a.id
  route_table_id = aws_route_table.test-blockchain-en-rt.id
}

resource "aws_route_table_association" "test-blockchain-en-pub-2c-rt" {
  subnet_id      = aws_subnet.test-blockchain-en-pub-2c.id
  route_table_id = aws_route_table.test-blockchain-en-rt.id
}

resource "aws_route_table" "test-blockchain-sen-rt" {
  vpc_id = aws_vpc.test-blockchain-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-blockchain-nat.id
  }

  tags = {
    Name = "test-blockchain-sen-rt"
  }
}

resource "aws_route_table_association" "test-blockchain-sen-pri-2a-rt" {
  subnet_id      = aws_subnet.test-blockchain-sen-pri-2a.id
  route_table_id = aws_route_table.test-blockchain-sen-rt.id
}

resource "aws_route_table_association" "test-blockchain-sen-pri-2c-rt" {
  subnet_id      = aws_subnet.test-blockchain-sen-pri-2c.id
  route_table_id = aws_route_table.test-blockchain-sen-rt.id
}


resource "aws_route_table" "test-blockchain-scn-rt" {
  vpc_id = aws_vpc.test-blockchain-vpc.id
  
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.test-blockchain-nat.id
  }

  tags = {
    Name = "test-blockchain-scn-rt"
  }
}

resource "aws_route_table_association" "test-blockchain-scn-pri-2a-rt" {
  subnet_id      = aws_subnet.test-blockchain-scn-pri-2a.id
  route_table_id = aws_route_table.test-blockchain-scn-rt.id
}

resource "aws_route_table_association" "test-blockchain-scn-pri-2b-rt" {
  subnet_id      = aws_subnet.test-blockchain-scn-pri-2b.id
  route_table_id = aws_route_table.test-blockchain-scn-rt.id
}

resource "aws_route_table_association" "test-blockchain-scn-pri-2c-rt" {
  subnet_id      = aws_subnet.test-blockchain-scn-pri-2c.id
  route_table_id = aws_route_table.test-blockchain-scn-rt.id
}

resource "aws_route_table_association" "test-blockchain-scn-pri-2d-rt" {
  subnet_id      = aws_subnet.test-blockchain-scn-pri-2d.id
  route_table_id = aws_route_table.test-blockchain-scn-rt.id
}
