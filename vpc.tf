# VPC
# https://www.terraform.io/docs/providers/aws/r/vpc.html
resource "aws_vpc" "terraformVpc" {
  cidr_block = var.VPC_CIDR
  enable_dns_support = true
  enable_dns_hostnames = true
  tags = {
    "Name" = "${var.PJPrefix}-vpc"
  }
}

# Subnet
# https://www.terraform.io/docs/providers/aws/r/subnet.html
resource "aws_subnet" "PublicSubnetA" {
  # 先程作成したVPCを参照し、そのVPC内にSubnetを立てる
  vpc_id = "${aws_vpc.terraformVpc.id}"

  # Subnetを作成するAZ
  availability_zone = "ap-northeast-1a"

  cidr_block        = var.PublicSubnetACIDR

  tags = {
    "Name" = "${var.PJPrefix}-PublicSubnetA"
  }
}

resource "aws_subnet" "PublicSubnetC" {
  vpc_id = "${aws_vpc.terraformVpc.id}"

  availability_zone = "ap-northeast-1c"

  cidr_block        = var.PublicSubnetCCIDR

  tags = {
    "Name" = "${var.PJPrefix}-PublicSubnetC"
  }
}

# Private Subnets
resource "aws_subnet" "PrivateSubnetA" {
  vpc_id = "${aws_vpc.terraformVpc.id}"

  availability_zone = "ap-northeast-1a"
  cidr_block        = var.PrivateSubnetACIDR

  tags = {
    "Name" = "${var.PJPrefix}-PrivateSubnetA"
  }
}

resource "aws_subnet" "PrivateSubnetC" {
  vpc_id = "${aws_vpc.terraformVpc.id}"

  availability_zone = "ap-northeast-1c"
  cidr_block        = var.PrivateSubnetCCIDR

  tags = {
    "Name" = "${var.PJPrefix}-PrivateSubnetC"
  }
}

# Internet Gateway
# https://www.terraform.io/docs/providers/aws/r/internet_gateway.html
resource "aws_internet_gateway" "terraformInternetGateway" {
  vpc_id = "${aws_vpc.terraformVpc.id}"

  tags = {
    "Name" = "${var.PJPrefix}-igw"
  }
}

# Route Table
# https://www.terraform.io/docs/providers/aws/r/route_table.html
resource "aws_route_table" "rtb_public" {
  vpc_id = "${aws_vpc.terraformVpc.id}"

  tags = {
    "Name" = "${var.PJPrefix}-rtb-public"
  }
}

# Route　routeテーブルとVPCの関連付け
# https://www.terraform.io/docs/providers/aws/r/route.html
resource "aws_route" "rtb_igw_public" {
  destination_cidr_block = "0.0.0.0/0"
  route_table_id         = "${aws_route_table.rtb_public.id}"
  gateway_id             = "${aws_internet_gateway.terraformInternetGateway.id}" # ゲートウェイのID
}

# Association routeテーブルとサブネットの関連付け
# https://www.terraform.io/docs/providers/aws/r/route_table_association.html
resource "aws_route_table_association" "PublicRouteA" {
  subnet_id      = "${aws_subnet.PublicSubnetA.id}" # サブネットのID
  route_table_id = "${aws_route_table.rtb_public.id}" # ルートテーブルのID
}

resource "aws_route_table_association" "PublicRouteC" {
  subnet_id      = "${aws_subnet.PublicSubnetC.id}"
  route_table_id = "${aws_route_table.rtb_public.id}"
}
