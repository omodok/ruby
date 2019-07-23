#####外部ファイルの読み込み
require "./def6keta.rb"

####これよりメインプログラム
puts "数字を6桁で画面表示"

f = File.open('cntlog')
cnt = f.read
f.close

cnt = cnt.to_i
cnt += 1

if cnt < 10
	hitoketa(cnt)
elsif cnt < 100
	hutaketa(cnt)
elsif cnt < 1000
	sanketa(cnt)
elsif cnt < 10000
	yonketa(cnt)
elsif cnt < 100000
	goketa(cnt)
else
	rokuketa(cnt)
end

File.open('cntlog','w') do |f|
	f.write cnt.to_s
end