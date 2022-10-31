resource "aws_vpc" "test_vpc" {
  cidr_block       = "10.0.0.0/16"
  tags = {
    Name = "test"
        }
}

resource "aws_subnet" "test_public_subnet" {
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "10.0.10.0/24"
  availability_zone = "eu-south-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "public"
        }
}

resource "aws_subnet" "test_private_subnet" {
  vpc_id     = "${aws_vpc.test_vpc.id}"
  cidr_block = "10.0.20.0/24"
  availability_zone = "eu-south-1a"
  map_public_ip_on_launch = "false"
  tags = {
    Name = "private"
        }
}

resource "aws_internet_gateway" "test_gw" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  tags = {
    Name = "main"
        }
}

resource "aws_route_table" "r" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.test_gw.id}"
  }
   tags = {
    Name = "public route"
  }
}

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.test_public_subnet.id
  route_table_id = aws_route_table.r.id
}

resource "aws_eip" "nat" {
vpc      = true
}

resource "aws_nat_gateway" "gw" {
  allocation_id = "${aws_eip.nat.id}"
  subnet_id     = "${aws_subnet.test_public_subnet.id}"
  tags = {
    Name = "gw NAT"
  }
}

resource "aws_route_table" "pvt" {
  vpc_id = "${aws_vpc.test_vpc.id}"
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_nat_gateway.gw.id}"
  }
   tags = {
    Name = "private route"
  }
}

resource "aws_route_table_association" "private" {
  subnet_id      = aws_subnet.test_private_subnet.id
  route_table_id = aws_route_table.pvt.id
}
