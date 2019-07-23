cmd = "rails g cancan:ability"
ReturnValue = system(cmd)
system( "echo '#{ReturnValue}'" )