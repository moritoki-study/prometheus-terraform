resource "aws_security_group" "terraform_prometheus_SG" {
  name        = "terraform_prometheus_SG"
  description = "Allow terraform prometheus vpc setting."
  # vpc_id      = "terraformVpc" # デフォルトvpcのID
  vpc_id = "${aws_vpc.terraformVpc.id}"
  # ここにingressを書かず、ルールはaws_security_group_ruleを使って定義する
 egress {
   from_port   = 0
   to_port     = 0
   protocol    = "-1"
   cidr_blocks = ["0.0.0.0/0"]
 }
}

# 80番ポート許可のインバウンドルール
resource "aws_security_group_rule" "http_ingress" {
  type        = "ingress"
  from_port   = 80
  to_port     = 80
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 22番ポート許可のインバウンドルール
resource "aws_security_group_rule" "ssh_ingress" {
  type        = "ingress"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 9090番ポート許可のインバウンドルール
resource "aws_security_group_rule" "prometheus_ingress" {
  type        = "ingress"
  from_port   = 9090
  to_port     = 9090
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 9100番ポート許可のインバウンドルール
resource "aws_security_group_rule" "node_exporter_ingress" {
  type        = "ingress"
  from_port   = 9100
  to_port     = 9100
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 3000番ポート許可のインバウンドルール
resource "aws_security_group_rule" "grafana_ingress" {
  type        = "ingress"
  from_port   = 3000
  to_port     = 3000
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 9093番ポート許可のインバウンドルール
resource "aws_security_group_rule" "alertmanager_ingress" {
  type        = "ingress"
  from_port   = 9093
  to_port     = 9093
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 9115番ポート許可のインバウンドルール
resource "aws_security_group_rule" "blackbox_exporter_ingress" {
  type        = "ingress"
  from_port   = 9115
  to_port     = 9115
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 9114番ポート許可のインバウンドルール
resource "aws_security_group_rule" "grok_exporter_ingress" {
  type        = "ingress"
  from_port   = 9144
  to_port     = 9144
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 8080番ポート許可のインバウンドルール
resource "aws_security_group_rule" "test_httpserver_ingress1" {
  type        = "ingress"
  from_port   = 8080
  to_port     = 8080
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}

# 8081番ポート許可のインバウンドルール
resource "aws_security_group_rule" "test_httpserver_ingress2" {
  type        = "ingress"
  from_port   = 8081
  to_port     = 8081
  protocol    = "tcp"
  cidr_blocks = "${var.MyIP}"

  # ここでweb_serverセキュリティグループに紐付け
  security_group_id = "${aws_security_group.terraform_prometheus_SG.id}"
}
