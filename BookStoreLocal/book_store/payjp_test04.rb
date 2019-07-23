require "bundler/setup"
require "payjp"
customerId = "cus_76abd2880b172ca4fa1dffdd8411"
Payjp::api_key = "sk_test_f676c46bd5891438b4724946"   #秘密鍵

####顧客IDを用いて支払いをする
kekka = Payjp::Charge.create(
  amount:   3000,
  customer:     customerId,
  currency: 'jpy'
)

puts kekka