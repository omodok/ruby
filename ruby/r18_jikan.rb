youbi =['日','月','火','水','木','金','土']
tstamp = Time.now.tv_sec
hizuke = Time.at(tstamp)
wkd = youbi[hizuke.wday]
puts hizuke.strftime("%Y年%m月%d日"+wkd+"曜日")
