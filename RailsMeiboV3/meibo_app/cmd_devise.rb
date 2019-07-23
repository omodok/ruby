#meibo_appへ全体をインストール
cmd = "rails generate devise:install"
ReturnValue = system(cmd)
system( "echo #{ReturnValue}" )

#userマイグレーションファイルを作成"
cmd = "rails generate devise user "
ReturnValue2 = system(cmd)
system( "echo #{ReturnValue}" )

#userマイグレーションファイルを実行
cmd = "rake db:migrate"
ReturnValue3 = system(cmd)
system( "echo #{ReturnValue}" )

#ユーザー認証用ビューの作成
cmd = "rails generate devise:views "
ReturnValue4 = system(cmd)
system( "echo '#{ReturnValue4}'" )