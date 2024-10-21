resource "aws_vpc" "vpc" {
  cidr_block = var.cider_block_vpc
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_subnet" "sub1" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_block_sub1 
}

resource "aws_subnet" "sub2" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = var.cidr_block_sub2
  tags = {
    Name = var.sub2_name
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Pingrame-igw"
  } 
}

resource "aws_route_table" "pub-rt1" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id    
  }

  tags = {
    Name = "pub-rt"
  }
}

resource "aws_route_table_association" "rta1" {
  subnet_id = aws_subnet.sub1.id
  route_table_id = aws_route_table.pub-rt1.id
}


resource "aws_route_table" "pub-rt2" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id    
  }

  tags = {
    Name = "pub-rt"
  }
}

resource "aws_route_table_association" "pubrt2" {
  subnet_id = aws_subnet.sub2.id
  route_table_id = aws_route_table.pub-rt2.id
}
