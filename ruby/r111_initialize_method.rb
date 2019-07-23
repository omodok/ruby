#これよりクラス定義
class Myclass
	#初期化メソッド定義
	def initialize(str)
		@str = str
	end
	#これよりメソッド定義
	def mymethod
		puts @str
	end
end
 

####これよりmainメソッド
def main
	mcs = Myclass.new("メソッドは電子レンジ、モジュールとクラスはキッチンだ。")
	mcs.mymethod
end

####これよりメインプログラム
if __FILE__ == $0
	main
end
