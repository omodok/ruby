cmd = "rails generate migration AddColumn3"
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )