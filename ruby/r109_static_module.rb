#これよりモジュール定義
module Mymodule
	module_function
	#これよりメソッド定義
	def mymethod
		puts "メソッドは電子レンジ、モジュールとクラスはキッチンだ。"
	end
end
 
#これよりメインプログラム
Mymodule.mymethod