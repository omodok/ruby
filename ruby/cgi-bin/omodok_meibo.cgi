####モジュールの読み込み
require 'cgi'
require "active_record"

####データベース接続
ActiveRecord::Base.establish_connection(adapter: "sqlite3",	database: "watashi.db")

####モデルクラスの作成
class Meibo < ActiveRecord::Base
end

####初期設定
@kensu = 5		#1ページに表示する件数
@mae = 0		#先頭ページの開始添え字
@tugi = @kensu	#先頭ページの次のページ
@pwd = "123456"	#削除用パスワード

####これよりメソッド定義
def sakujo(fom) 
	id =  0...@kensu
	id.each do |i| 
		if fom[i.to_s] != "" 	#レコードの削除
			Meibo.destroy(fom[i.to_s])
		end
	end
end

def pagenation(lines,fom) 
	kaishi = 0

	page = fom["page"]

	if page!=""
		kaishi= page.to_i
	end
	
	@tugi=kaishi+@kensu

	if @tugi > lines.size
		@tugi = lines.size
	end
	
	@mae=kaishi-@kensu

	if @mae < 0
		@mae = 0
	end
	
	id = kaishi...@tugi
	
	return id

end

def tuika(fom) 
	#安全なデータ受信処理：開始
	fom = fom.params
	fom.each do |key, val|
		val = val[0]
		val.gsub!(',', '，' ) 		#最後の，は全角文字
		val = CGI.escapeHTML(val)
		val.gsub!('\r\n', '<br />')
		val.gsub!('\n', '<br />')
		val.gsub!('\r', '<br />')
		fom[key] = val
	end
	#安全なデータ受信処理：終了

	shimei = fom["shimei"]
	jusyo = fom["jusyo"]
	denwa = fom["denwa"]
	
	#レコードの挿入
	mei = Meibo.new
	mei.shimei = shimei
	mei.jusyo = jusyo
	mei.denwa = denwa
	mei.save()
end

def errorStr(str) 
	print str
	print "<br />ブラウザの戻るボタンでお戻りください。"
	print "</body></html>"
	exit
end

####これよりhtml表示
print "Content-Type: text/html\n\n"
print(<<"HTML_END")
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>名簿</title></head>
<body bgcolor="#ffff99">
HTML_END

####これよりメインプログラム
fom = CGI.new 

if fom['shimei'] != "" and fom['jusyo'] != ""
	tuika(fom)

elsif fom["shimei"] != "" and not fom["jusyo"] != ""
	errorStr("住所がありません。入力してください。") 

elsif not fom["shimei"] != "" and fom["jusyo"] != ""
	errorStr("氏名がありません。入力してください。") 
elsif fom["sakujo"] == @pwd 
	sakujo(fom) 
end

####これよりbody内容
print(<<"HTML_END")
<h1 style="font-size:1.5em">Ruby簡易名簿</h1>
<form action="/cgi-bin/omodok_meibo.cgi" method="post">
氏名<input name="shimei" value=""><br />
住所<textarea cols="50" row="2" wrap="soft" name="jusyo"></textarea><br />
電話<input name="denwa">
<input type="submit" value="送信">
</form>
<hr/>
<form action="omodok_meibo.cgi" method="post">
<table border="1" width="700">
<tr><th>削除No.</th><th>氏名</th><th>住所</th><th>電話</th></tr>
HTML_END

#レコードの取得
lines = Meibo.select("*").all

id = pagenation(lines,fom)

ksnum = 0
id.each do |i|
	print(<<"HTML_END")
<tr><td width="75">
<input type="checkbox" name="#{ksnum}" value="#{lines[i].id}">#{lines[i].id}</td>
<td>#{lines[i].shimei}</td>
<td>#{lines[i].jusyo}</td>
<td>#{lines[i].denwa}</td></tr>
HTML_END
	ksnum += 1
end

puts '</table><hr />'
puts '<input type="password" name="sakujo">'
puts '<input type="submit" value="管理用削除"></form>'
puts "<a href=\"/cgi-bin/omodok_meibo.cgi?page=#{@mae}\">前の#{@kensu}件へ</a>"
puts "<a href=\"/cgi-bin/omodok_meibo.cgi?page=#{@tugi}\">次の#{@kensu}件へ</a>"
puts '</body></html>'

#print "Content-type: text/html\n\n"
#puts '<meta charset="utf-8" />'
#puts "ここまでOK"
#exit

#print "Content-type: text/html¥n¥n"
#puts '<meta charset="utf-8" />'
#puts "<br>fom連想配列の中身：<br>"
#p fom
#puts "<br>"

