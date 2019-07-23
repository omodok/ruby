require "bundler/setup"
require 'payjp'
tokenId = "tok_tok_145d64a2b64111d5acf7d8f046b6"
Payjp::api_key = "pk_test_4c9278be583d9a063637d616"   #公開鍵

####カードトークンを生成する
token = Payjp::Token.create(
  card: {
    number:    '4242424242424242',
    cvc:       '123',
    exp_month: '2',
    exp_year:  '2020',
  }
)

puts token.id