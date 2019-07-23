####外部ファイルの読み込み
require "sqlite3"

####データベース接続
con = SQLite3::Database.new("watashi.db")
	
#テーブル作成
sql = <<SQL_END
create table meibos (
 id integer primary key autoincrement,
 shimei varchar(10),
 jusyo varchar(200),
 denwa varchar(20)
)
SQL_END

begin
	con.execute(sql)
	puts "SQLテーブルを作成しました。"
rescue SQLite3::SQLException => e
	puts "SQLテーブル作成を失敗しました。"+e.to_s
end

#データベース終了
con.close