puts "数字を6桁で画面表示"

f = File.open('cntlog')
cnt = f.read
f.close

cnt = cnt.to_i
cnt += 1

if cnt < 10
	puts "00000"+cnt.to_s
elsif cnt < 100
	puts "0000"+cnt.to_s
elsif cnt < 1000
	puts "000"+cnt.to_s
elsif cnt < 10000
	puts "00"+cnt.to_s
elsif cnt < 100000
	puts "0"+cnt.to_s
else
	puts cnt
end

File.open('cntlog','w') do |f|
	f.write cnt.to_s
end