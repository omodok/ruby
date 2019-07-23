hsh = {"氏名"=>"小椋　稔","住所"=>"東京都新宿区百人町2-4-5-607","電話"=>"03-5348-1283"}
shimei = hsh['氏名']
jusyo = hsh['住所']
denwa = hsh['電話']

begin
	f = File.open("meibolog", encoding: 'UTF-8')
rescue => e
	f = File.open("meibolog","a+")
end

lines = f.readlines
f.close

value = shimei+","+jusyo+","+denwa+"\n" 
if 3 <= lines.size
	lines.pop
end
lines.unshift(value)

File.open('meibolog','w:UTF-8') do |f|
	line = lines.join("") 
	f.write line 
end
puts lines