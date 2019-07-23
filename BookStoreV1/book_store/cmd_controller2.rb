cmd = "rails g controller frontend"
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )