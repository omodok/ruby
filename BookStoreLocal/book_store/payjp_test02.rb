require "bundler/setup"
require "payjp"
tokenId = "tok_bd713590690cdae8f92a950b0995"
Payjp::api_key = "sk_test_f676c46bd5891438b4724946"   #秘密鍵

####カードトークンを用いて支払いを作成する
kekka = Payjp::Charge.create(
  amount:   3000,
  card:     tokenId,
  currency: 'jpy'
)

puts kekka