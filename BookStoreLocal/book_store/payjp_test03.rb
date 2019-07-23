require "bundler/setup"
require "payjp"
tokenId = "tok_1e0aacbd9ecc5fc499c9e2bb0f25"
Payjp::api_key = "sk_test_f676c46bd5891438b4724946"   #秘密鍵

####カードトークンを用いて顧客IDを作成する
kekka = Payjp::Customer.create(
  email:    "school2@omodok.co.jp",
  card:     tokenId,
)

puts kekka