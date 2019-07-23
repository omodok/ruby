####外部ファイルの読み込み
require "active_record"

####データベース接続
ActiveRecord::Base.establish_connection(
	adapter:   "sqlite3", 
	database: "watashi.db"
)

####モデルクラスの作成
class Meibos < ActiveRecord::Base
end

#レコードの挿入
mei = Meibos.new
mei.shimei = "田中"
mei.jusyo = "神奈川県"
mei.denwa = "044"
mei.save()

#レコード削除
#Meibos.destroy(18)

#レコードの取得
lines = Meibos.select("*").all

#テーブルの表示
lines.each do |line| 
	puts "#{line.id},#{line.shimei},#{line.jusyo},#{line.denwa}"
end

