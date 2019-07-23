class Class6keta
	#####クラス変数の宣言
	@@frontstr = "学籍番号は"
	@@rearstr = "です。"
	
	#####アクセスメソッド定義
	def frontstr
		@@frontstr
	end

	def rearstr
		@@rearstr
	end
	
	#####クラスメソッド定義
	def hitoketa(cnt)
		print "00000"+cnt.to_s
	end

	def hutaketa(cnt)
		print "0000"+cnt.to_s
	end

	def sanketa(cnt)
		print "000"+cnt.to_s
	end

	def yonketa(cnt)
		print "00"+cnt.to_s
	end

	def goketa(cnt)
		print "0"+cnt.to_s
	end

	def rokuketa(cnt)
		print cnt
	end
end