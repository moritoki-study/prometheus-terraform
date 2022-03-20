# これは固定で良いと思う
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# 自分の.awsを見ればわかる。東京ならこの設定で固定で良いと思う
provider "aws" {
  profile = "default"
  region = "ap-northeast-1"
}
