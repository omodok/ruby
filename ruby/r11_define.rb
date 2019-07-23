#####これ以下はメソッド定義
def hitoketa(cnt)
	puts "00000"+cnt.to_s
end

def hutaketa(cnt)
	puts "0000"+cnt.to_s
end

def sanketa(cnt)
	puts "000"+cnt.to_s
end

def yonketa(cnt)
	puts "00"+cnt.to_s
end

def goketa(cnt)
	puts "0"+cnt.to_s
end

def rokuketa(cnt)
	print cnt
end
	
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
elif cnt < 1000
	sanketa(cnt)
elif cnt < 10000
	yonketa(cnt)
elif cnt < 100000
	goketa(cnt)
else
	rokuketa(cnt)
end

File.open('cntlog','w') do |f|
	f.write cnt.to_s
end