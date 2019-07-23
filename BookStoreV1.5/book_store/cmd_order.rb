cmd = "rails g model order" 
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )