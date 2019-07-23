#meibo_appへ全体をインストール
cmd = "rails generate devise:install"
ReturnValue = system(cmd)
system( "echo #{ReturnValue}" )

#userマイグレーションファイルを作成"
cmd = "rails generate devise user "
ReturnValue2 = system(cmd)
system( "echo '#{ReturnValue2}'" )

#userマイグレーションファイルを実行
cmd = "bundle exec rake db:migrate"
ReturnValue3 = system(cmd)
system( "echo '#{ReturnValue3}'" )

#ユーザー認証用ビューの作成
cmd = "rails generate devise:i18n:views "
ReturnValue4 = system(cmd)
system( "echo '#{ReturnValue4}'" )

#devise-i18n用日本語化ファイルの作成
cmd = "rails generate devise:i18n:locale ja "
ReturnValue5 = system(cmd)
system( "echo '#{ReturnValue5}'" )