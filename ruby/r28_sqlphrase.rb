####外部ファイルの読み込み
require "sqlite3"

####データベース接続
con = SQLite3::Database.new("watashi.db")
	
#レコードの挿入
sql = "insert into meibos values (null,'小椋', '東京都新宿区', '03-')"
con.execute(sql)

#レコードの取得
lines = con.execute("select * from meibos")

#テーブルの表示
lines.each do |line|  
	puts "#{line[0]},#{line[1]},#{line[2]},#{line[3]}"
end

#データベース終了
con.close