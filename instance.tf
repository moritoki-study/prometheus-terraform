# ここはインスタンスの設定。自分の好みの設定に変える。
# aws_instanceは固定
# 他にも設定可能
resource "aws_instance" "PrometheusEC2" {
  ami = "ami-08a8688fb7eacb171"
  instance_type = "t2.micro"
  subnet_id                   = aws_subnet.PublicSubnetA.id
  vpc_security_group_ids = [aws_security_group.terraform_prometheus_SG.id]
  associate_public_ip_address = true
  private_ip = "10.1.10.100"
  key_name = "rsa"
  tags = {
    "Name" = "prometheus.host"
  }
}

resource "aws_instance" "TestHttpserverEC2" {
  ami = "ami-08a8688fb7eacb171"
  instance_type = "t2.micro"
  subnet_id                   = aws_subnet.PublicSubnetA.id
  vpc_security_group_ids = [aws_security_group.terraform_prometheus_SG.id]
  associate_public_ip_address = true
  private_ip = "10.1.10.110"
  key_name = "rsa"
  tags = {
    "Name" = "testhttpserver.host"
  }
}

# output
output "public_dns_PrometheusEC2" {
  value = aws_instance.PrometheusEC2.public_dns
}
output "public_dns_TestHttpserverEC2" {
  value = aws_instance.TestHttpserverEC2.public_dns
}
