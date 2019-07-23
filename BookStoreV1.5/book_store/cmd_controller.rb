cmd = "rails g controller backend"
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )