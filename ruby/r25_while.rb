hsh = {"氏名"=>"小椋　稔","住所"=>"東京都新宿区百人町2-4-5-607","電話"=>"03-5348-1283"}

hsh = hsh.to_a

i=0
while i < hsh.size
	print hsh[i][0]
	puts hsh[i][1]
	i += 1
end