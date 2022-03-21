# ここはインスタンスの設定。自分の好みの設定に変える。
data "aws_ssm_parameter" "amzn2_latest" {
  name = "/aws/service/ami-amazon-linux-latest/amzn2-ami-kernel-5.10-hvm-x86_64-gp2"
}

# aws_instanceは固定
# 他にも設定可能
resource "aws_instance" "PrometheusEC2" {
  ami = data.aws_ssm_parameter.amzn2_latest.value
  instance_type = var.InstanceType
  subnet_id                   = aws_subnet.PublicSubnetA.id
  vpc_security_group_ids = [aws_security_group.terraform_prometheus_SG.id]
  associate_public_ip_address = true
  private_ip = var.PrometheusEC2_PrivateIpAddress
  key_name = var.KeyName
  tags = {
    "Name" = var.PrometheusEC2_tag_name
  }
}

resource "aws_instance" "TestHttpserverEC2" {
  ami = data.aws_ssm_parameter.amzn2_latest.value
  instance_type = var.InstanceType
  subnet_id                   = aws_subnet.PublicSubnetA.id
  vpc_security_group_ids = [aws_security_group.terraform_prometheus_SG.id]
  associate_public_ip_address = true
  private_ip = var.TestHttpserverEC2_PrivateIpAddress
  key_name = var.KeyName
  tags = {
    "Name" = var.TestHttpserverEC2_tag_name
  }
}

# output
output "public_dns_PrometheusEC2" {
  value = aws_instance.PrometheusEC2.public_dns
}
output "public_dns_TestHttpserverEC2" {
  value = aws_instance.TestHttpserverEC2.public_dns
}
