kojinJoho ='小椋　稔"東京\r\n都\n新宿\r区,百人町2-4-5-607<03-5348-1283>'
kojinJoho.gsub!(',', '，' ) 		#最後の，は全角文字
kojinJoho.gsub!('&', '&amp') 
kojinJoho.gsub!('"', '&quot') 		#第1引数は「'」「"」「'」
kojinJoho.gsub!('<', '&lt') 
kojinJoho.gsub!('>', '&gt')
kojinJoho.gsub!('\r\n', '<br />')
kojinJoho.gsub!('\n', '<br />')
kojinJoho.gsub!('\r', '<br />')

puts kojinJoho