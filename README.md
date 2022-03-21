# prometheus-terraform
vpcとinstance等をterraformで作ってくれる。アプリケーションのセットアップは行わない

セットアップは以下のansibleを動かせばいけると思う。
https://github.com/moritoki-study/prometheus-playbook

ansibleも自動で動かそうとしたがパブリックIPが処理中に参照する方法が不明なので諦めた。

# 動かす方法
```
git clone https://github.com/moritoki-study/prometheus-terraform.git
cd prometheus-terraform

# tfファイルが揃った時点で必要と思われる。追加したときなど。
terraform init  

# rfファイルの検証コマンド
terraform validate

# テスト実行
terraform plan

# 環境作成コマンド
terraform apply -auto-approve

# 環境削除コマンド
terraform destroy -auto-approve

# 設定確認
terraform show
```

# MODULE化
これはやってない。
https://sagantaf.hatenablog.com/entry/2020/10/23/231609
おそらく環境変数を上書きするファイルを新たに作り、いろんな設定を使いまわせるようになる。
