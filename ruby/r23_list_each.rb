print "Content-Type: text/html\n\n"
print(<<"HTML_END")
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>名簿</title></head>
<body bgcolor="#ffff99">
<table border="1" width="700">
<tr><th>氏名</th><th>住所</th><th>電話</th></tr>
HTML_END

begin
	f = File.open("meibolog", encoding: 'UTF-8')
rescue => e
	f = open("meibolog","a+")
end

lines = f.readlines
f.close

id = 0...lines.size
id.each do |i|
	shimei,jusyo,denwa = lines[i].split(",")
	print(<<"HTML_END")
<tr><td>#{shimei}</td>
<td>#{jusyo}</td>
<td>#{denwa}</td></tr>
HTML_END
end

puts '</table>'
puts '</body></html>'
