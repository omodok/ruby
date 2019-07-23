p Time.new.to_i
tstamp = Time.now.tv_sec
hizuke = Time.at(tstamp)
p hizuke
p hizuke.year
p hizuke.month
p hizuke.day
p hizuke.strftime("%Y年%m月%d日%H時%M分%S秒")