variable profile {
  type = string
  description = "profile name"
  default = "default"
}

variable region {
  type = string
  description = "aws region"
  default = "ap-northeast-1"
}

variable PJPrefix {
  type = string
  description = "VPC、サブネット名の頭に付く文字列"
  default = "terraform-prometheus"
}

variable VPC_CIDR {
  type = string
  description = "VPCのCIDR"
  default = "10.1.0.0/16"
}

variable PublicSubnetACIDR {
  type = string
  description = "PublicSubnetACIDR"
  default = "10.1.10.0/24"
}

variable PublicSubnetCCIDR {
  type = string
  description = "PublicSubnetCCIDR"
  default = "10.1.20.0/24"
}

variable PrivateSubnetACIDR {
  type = string
  description = "PrivateSubnetACIDR"
  default = "10.1.100.0/24"
}

variable PrivateSubnetCCIDR {
  type = string
  description = "PrivateSubnetCCIDR"
  default = "10.1.200.0/24"
}

variable KeyName {
  type = string
  description = "ssh KeyName"
  default = "rsa"
}

variable InstanceType {
  type = string
  description = "InstanceType"
  default = "t2.micro"
}

variable PrometheusEC2_tag_name {
  type = string
  description = "PrometheusEC2_tag_name"
  default = "prometheus.host"
}

variable TestHttpserverEC2_tag_name {
  type = string
  description = "TestHttpserverEC2_tag_name"
  default = "testhttpserver.host"
}

variable PrometheusEC2_PrivateIpAddress {
  type = string
  description = "PrometheusEC2_PrivateIpAddress"
  default = "10.1.10.100"
}

variable TestHttpserverEC2_PrivateIpAddress {
  type = string
  description = "TestHttpserverEC2_PrivateIpAddress"
  default = "10.1.10.110"
}

variable MyIP {
  type = list
  description = "MyIP"
  default = ["106.72.134.33/32", "106.72.134.34/32"]
}
