#####外部ファイルの読み込み
require "./Class6keta.rb"

#####オブジェクトのインスタンス化
txtcnt = Class6keta.new

####これよりメインプログラム
print txtcnt.frontstr

f = File.open('cntlog')
cnt = f.read
f.close

cnt = cnt.to_i
cnt += 1

if cnt < 10
	txtcnt.hitoketa(cnt)
elsif cnt < 100
	txtcnt.hutaketa(cnt)
elsif cnt < 1000
	txtcnt.sanketa(cnt)
elsif cnt < 10000
	txtcnt.yonketa(cnt)
elsif cnt < 100000
	txtcnt.goketa(cnt)
else
	txtcnt.rokuketa(cnt)
end

File.open('cntlog','w') do |f|
	f.write cnt.to_s
end

puts txtcnt.rearstr
