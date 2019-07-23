cmd = "rails g model product" 
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )