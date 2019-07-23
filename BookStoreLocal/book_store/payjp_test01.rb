require "bundler/setup"
require "payjp"

Payjp::api_key = "pk_test_4c9278be583d9a063637d616"   #公開鍵

####カードトークンを生成する
token = Payjp::Token.create({
  card: {
    number:    '4242424242424242',
    cvc:       '123',
    exp_month: '2',
    exp_year:  '2020',
  }},
  {
    'X-Payjp-Direct-Token-Generate': 'true'
  }
)

puts token.id