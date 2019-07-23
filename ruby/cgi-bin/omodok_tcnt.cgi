#!/usr/bin/ruby
class Initialize6keta
	#####初期化メソッド定義
	def initialize(str1, str2)
		@frontstr = str1
		@rearstr = str2
	end
	
	#####アクセスメソッド定義
	def frontstr
		@frontstr
	end

	def rearstr
		@rearstr
	end
	
	#####クラスメソッド定義
	def rokuketa
		f = File.open('cntlog')
		cnt = f.read
		f.close

		cnt = cnt.to_i
		cnt += 1

		print @frontstr
		printf('%06d',  cnt)
		puts @rearstr
		
		File.open('cntlog','w') do |f|
			f.write cnt.to_s
		end
	end
end

####これよりmainメソッド
def main
	print "Content-Type: text/html\n\n"
	print(<<"HTML_END")
<!DOCTYPE html>
<html><head><meta charset="UTF-8">
<title>カウンター</title></head>
<body bgcolor="#ffff99"><div style="text-align:center">
HTML_END

	txtcnt = Initialize6keta.new("あなたは","人目の訪問者です。")
	txtcnt.rokuketa
	
	puts '</div></body></html>'
end

####これよりメインプログラム
if __FILE__ == $0
	main
end

