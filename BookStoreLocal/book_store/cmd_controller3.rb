cmd = "rails g controller Users index edit update"
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )